# ca-readme-tracking-links-action

This action inspects the main README.md of your repository and ensures that links shared are properly tagged for advocacy trends.

## Inputs

### `alias`

Your user alias.

### `event`

Description of the type of content or **key** being shared.

### `channel`

This should be **github**, feel free to change to anything relative to your project.

### Outputs

## `README`

The action will write a new version of the README.md file. The usage section below includes the needed **commit** functionality to merge to master.

## Example usage

```yml
on: [push]

jobs:
    link_checker_job:
        runs_on: ubuntu-latest
        name: Checking my links
        steps:
        - name: Run CA Link Checker
        id: checker
        uses: spboyer/ca-readme-tracking-links-action@v1
        with:
          alias: 'shboyer'
          event: 'coolcodesample'
          channel: 'github'

        - name: Commit results
        run: |
            git config --global user.name "Shayne Boyer"
            git config --global user.email "spboyer@live.com"
            git commit README.md -m 'Re-build README.md' || echo "No changes to commit"
            git push origin || echo "No changes to commit"
```

## Link Testing Area

[VS](https://visualstudio.com)

[Create a Web API](https://docs.microsoft.com/aspnet/core/tutorials/first-web-api?view=aspnetcore-3.1&tabs=visual-studio)

No Link Test
