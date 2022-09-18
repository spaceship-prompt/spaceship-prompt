# Розділювач рядків `line_sep`

The `line_sep` section is used as a line break for the prompt.

## Adding more line breaks to the prompts

You can add more line breaks to the prompt by adding more `line_sep` sections where you want. You can use `spaceship add` command for that:

```zsh title=".zshrc"
# Adds a line break after the git section
spaceship add --after git line_sep

# Adds a line break before the char section
spaceship add --before char line_sep
```

## Disabling line separator

You can avoid line breaks by setting `SPACESHIP_PROMPT_SEPARATE_LINE` to `false`.

```zsh title=".zshrc"
# Avoids rendering of the line_sep
SPACESHIP_PROMPT_SEPARATE_LINE=false
```

## Removing `line_sep` from the prompt

You can remove `line_sep` from the prompt entirely like this:

```zsh title=".zshrc"
spaceship remove line_sep
```

## Опції

| Змінна                           | За замовчуванням | Пояснення                      |
|:-------------------------------- |:----------------:| ------------------------------ |
| `SPACESHIP_PROMPT_SEPARATE_LINE` |      `true`      | Відображати розділювачі рядків |
