---
name: release
description: Create a GitHub release with changelog. Use when the user wants to tag a version, create a release, or publish a new version.
---

# Create Release

## Steps

1. **Determine version:**
   - Read current version from `package.json`
   - Ask user for bump type if not specified: patch (1.0.x), minor (1.x.0), major (x.0.0)

2. **Generate changelog from commits since last tag:**
   ```bash
   LAST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "")
   if [ -n "$LAST_TAG" ]; then
     COMMITS=$(git log ${LAST_TAG}..HEAD --oneline --no-merges)
   else
     COMMITS=$(git log --oneline --no-merges -20)
   fi
   ```

3. **Categorize commits:**
   - Features (`feat:`)
   - Bug Fixes (`fix:`)
   - Documentation (`docs:`)
   - Tests (`test:`)
   - CI/CD (`ci:`)
   - Other

4. **Create tag and release:**
   ```bash
   VERSION="v<new_version>"
   git tag -a $VERSION -m "Release $VERSION"
   git push origin $VERSION

   gh release create $VERSION \
     --title "$VERSION" \
     --notes "$(cat <<'EOF'
   ## What's Changed

   ### Features
   - <feat commits>

   ### Bug Fixes
   - <fix commits>

   ### Other
   - <other commits>

   **Full Changelog**: https://github.com/<owner>/<repo>/compare/<prev_tag>...$VERSION
   EOF
   )"
   ```

5. **Return the release URL**
