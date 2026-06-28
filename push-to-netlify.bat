@echo off
REM Push uncommitted changes to GitHub → auto-triggers Netlify deploy
cd /d "%~dp0"
echo Staging all changes...
git add -A
echo Committing...
git commit -m "Deploy: update app pages, components, migrations, and deps"
echo Pushing to GitHub (this triggers Netlify build)...
git push origin master
echo Done! Monitor deploy at: https://app.netlify.com/sites/kotonohalearnjapanese/deploys
pause
