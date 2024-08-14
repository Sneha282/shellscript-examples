#!/bin/bash
REPO_NAME="my-new-repo1"
REPO_DESC="A description of my new repository"
GITHUB_TOKEN="Personal access token(classic)"
GITHUB_USERNAME="Sneha282"
COLLABORATOR="Sneha982"
# Create a local Git repository
echo "Creating local Git repository..."
mkdir "$REPO_NAME"
cd "$REPO_NAME" || exit
git init
echo "# $REPO_NAME" > README.md
git add README.md
git commit -m "Initial commit"

# Create a new repository on GitHub
echo "Creating remote repository on GitHub..."
RESPONSE=$(curl -s -H "Authorization: token $GITHUB_TOKEN" -d "{\"name\": \"$REPO_NAME\", \"description\": \"$REPO_DESC\", \"private\": false}" https://api.github.com/user/repos)
# Extract the repository URL



REPO_URL=$(echo "$RESPONSE" | jq -r '.clone_url')

if [ "$REPO_URL" == "null" ]; then
    echo "Error creating repository on GitHub."
    echo "Response: $RESPONSE"
    exit 1
fi

# Add the remote repository
git remote add origin "$REPO_URL"
git push -u origin master

# Add collaborator
echo "Adding collaborator to GitHub repository..."
#curl -s -H "Authorization: token $GITHUB_TOKEN" -d "{\"permission\": \"push\"}" "https://api.github.com/repos/$GITHUB_USERNAME/$REPO_NAME/collaborators/$COLLABORATOR"

curl -s -X PUT -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  "https://api.github.com/repos/$GITHUB_USERNAME/$REPO_NAME/collaborators/$COLLABORATOR"

echo "Repository setup completed successfully."


#List the repos
To list the repo names

curl -s -H "Authorization: token $GITHUB_TOKEN"   https://api.github.com/user/repos | jq -r '.[].name'
