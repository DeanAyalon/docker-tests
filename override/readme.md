# Use
Override or reset values via a Compose override file

## Problem
Compose-spec does not seem to recognize the `!reset` and `!override` keywords
> The tags can be added to settings for VS Code to recognize: 
> ```json
>   "yaml.customTags": [
>       "!override", "!override sequence",
>       "!reset", "!reset sequence"
>   ]
>   ```

## Source
https://docs.docker.com/reference/compose-file/merge