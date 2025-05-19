Here’s a comprehensive, example-rich blog post that both teaches and demonstrates a wide array of Markdown formatting styles. You can copy and paste the following into any Markdown editor to see how each element renders.

## Summary

In this blog, you’ll learn and see live examples of nearly every common and extended Markdown feature: from basic headings and emphasis to lists, code blocks, tables, images, links, blockquotes, task lists, and even advanced hacks like collapsible sections and inline HTML. Each section includes both the raw Markdown syntax and a short rendered preview so you can immediately see how it works. Whether you’re writing a README, a blog post, or documentation, you’ll have this post as a quick reference for crafting richly formatted Markdown content.

---

## Headings

### ATX Headings

```markdown
# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6
```

# Heading 1

## Heading 2

### Heading 3

#### Heading 4

##### Heading 5

###### Heading 6

Headings are created by placing one to six `#` characters at the start of a line, with more `#` producing smaller headings ([commonmark.org][1]).

### Setext Headings

```markdown
Heading Level 1
===============
  
Heading Level 2
---------------
```

# Heading Level 1

## Heading Level 2

Setext-style headings use underlines of `=` or `-` below text; they are limited to two levels but can be easier to read in plain text ([spec.commonmark.org][2]).

---

## Emphasis

```markdown
*Italic* _Italic_
**Bold** __Bold__
***Bold & Italic***
```

*Italic*  *Italic*
**Bold**  **Bold**
***Bold & Italic***
Wrap text in single asterisks or underscores for *italic* and double for **bold** ([commonmark.org][3]).

---

## Lists

### Unordered Lists

```markdown
- Item A
* Item B
+ Item C
```

* Item A

- Item B

* Item C
  You may use `-`, `*`, or `+` interchangeably, but be consistent within a list ([commonmark.org][4]).

### Ordered Lists

```markdown
1. First
2. Second
3. Third
```

1. First
2. Second
3. Third
   Numbers followed by a period (or right parenthesis) create ordered lists ([commonmark.org][4]).

### Nested Lists

```markdown
1. Parent
   - Child
     1. Grandchild
```

1. Parent

   * Child

     1. Grandchild

---

## Code

### Inline Code

```markdown
Use the `printf()` function.
```

Use the `printf()` function.

### Fenced Code Blocks

````markdown
```javascript
function greet() {
  console.log("Hello, world!");
}
````

````
```javascript
function greet() {
  console.log("Hello, world!");
}
````

Triple backticks before and after create code blocks; you can optionally specify a language for syntax highlighting ([GitHub Docs][5], [GitHub Docs][6]).

### Indented Code Blocks

```markdown
    This is also a code block
    over multiple lines.
```

```
This is also a code block
over multiple lines.
```

---

## Blockquotes

```markdown
> “Markdown is a lightweight markup language.”
> — John Gruber
```

> “Markdown is a lightweight markup language.”
> — John Gruber

Each line prefixed with `>` becomes part of the quote. You can nest blockquotes by adding more `>`.

---

## Links & Images

### Links

```markdown
[OpenAI](https://www.openai.com)
```

[OpenAI](https://www.openai.com)

### Automatic Links

```markdown
<https://www.openai.com>
```

[https://www.openai.com](https://www.openai.com)

### Images

```markdown
![Alt text](https://via.placeholder.com/150)
```

![Alt text](https://via.placeholder.com/150)

### Linked Images

```markdown
[![Logo](https://via.placeholder.com/50)](https://www.openai.com)
```

[![Logo](https://via.placeholder.com/50)](https://www.openai.com)
Enclose the image Markdown in `[]` and put the link in `()` for clickable images ([Markdown Guide][7]).

---

## Tables

```markdown
| Syntax | Description |
|--------|-------------|
| Header | Table header |
| Cell   | Table cell   |
```

| Syntax | Description  |
| ------ | ------------ |
| Header | Table header |
| Cell   | Table cell   |

Use pipes `|` to separate columns and dashes `-` to underline headers; colons can align text (`:---`, `:---:`, `---:`) ([Markdown Guide][8]).

---

## Task Lists

```markdown
- [x] Completed item
- [ ] Incomplete item
```

* [x] Completed item
* [ ] Incomplete item

GitHub Flavored Markdown lets you create interactive checklists by adding `[ ]` or `[x]` inside list items ([Markdown Guide][8]).

---

## Horizontal Rules

```markdown
---
***
___
```

---

---

---

Lines of three or more `-`, `*`, or `_` on their own create thematic breaks.

---

## Inline HTML

```markdown
<p style="color: red;">This is a red paragraph.</p>
```

<p style="color: red;">This is a red paragraph.</p>  
You can drop raw HTML for features not supported natively in Markdown; support varies by renderer.

---

## Collapsible Sections (Details)

```markdown
<details>
<summary>Click to expand</summary>

Hidden content goes here.

</details>
```

<details>
<summary>Click to expand</summary>

Hidden content goes here.

</details>  
Use the `<details>` and `<summary>` tags for collapsible content on platforms that support it :contentReference[oaicite:9]{index=9}.

---

## Hacks & Extensions

* **Footnotes** (via extensions):

  ```markdown
  Here is a footnote reference,[^1]

  [^1]: Footnote text.
  ```
* **Definition lists** (via MultiMarkdown):

  ```markdown
  Term
  : Definition text
  ```

These extended features require specific Markdown processors or extensions ([Markdown Guide][9], [Markdown Guide][8]).

---

## Further Reading & Tools

* **CommonMark Spec** – the formal specification of Markdown syntax ([spec.commonmark.org][10])
* **GitHub Markdown Docs** – GitHub Flavored Markdown and advanced tips ([GitHub Docs][11])
* **The Markdown Guide** – a polished reference site covering basic through advanced syntax ([Markdown Guide][12])

---

Feel free to bookmark or clone this post as a handy Markdown cheat sheet. Happy writing!

[1]: https://commonmark.org/help/tutorial/04-headings.html?utm_source=chatgpt.com "Headings - Markdown Tutorial - CommonMark"
[2]: https://spec.commonmark.org/0.20/?utm_source=chatgpt.com "Setext headers - CommonMark Spec"
[3]: https://commonmark.org/help/tutorial/02-emphasis.html?utm_source=chatgpt.com "Emphasis - Markdown Tutorial - CommonMark"
[4]: https://commonmark.org/help/tutorial/06-lists.html?utm_source=chatgpt.com "Markdown Tutorial - Lists - CommonMark"
[5]: https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/creating-and-highlighting-code-blocks?utm_source=chatgpt.com "Creating and highlighting code blocks - GitHub Docs"
[6]: https://docs.github.com/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax?utm_source=chatgpt.com "Basic writing and formatting syntax - GitHub Docs"
[7]: https://www.markdownguide.org/basic-syntax/?utm_source=chatgpt.com "Basic Syntax - Markdown Guide"
[8]: https://www.markdownguide.org/extended-syntax/?utm_source=chatgpt.com "Extended Syntax - Markdown Guide"
[9]: https://www.markdownguide.org/hacks/?utm_source=chatgpt.com "Hacks - Markdown Guide"
[10]: https://spec.commonmark.org/0.30/?utm_source=chatgpt.com "0.30 - CommonMark Spec"
[11]: https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting?utm_source=chatgpt.com "Working with advanced formatting - GitHub Docs"
[12]: https://www.markdownguide.org/?utm_source=chatgpt.com "Markdown Guide"
