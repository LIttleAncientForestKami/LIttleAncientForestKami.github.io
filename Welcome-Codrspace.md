Powered by CodrSpace / GitHub / Markdown, on a trial run.

## Why CodrSpace?

And why not? I'll most likely try few others as well. It's a trial run, to see if I'd like to switch here and what does it offer.

After all **doing** and **experiencing** is preferable to just _looking at_ or _reading about_.

### What I'm after

* [markdown](http://daringfireball.net/projects/markdown/) ([asciidoc](http://asciidoctor.org/docs/user-manual/) even better) posts
* pushing posts from Vim/Git
* being able to see them as I type is a plus
* nested lists
* handling code well 
 * inline
 * via `code` or `pre` - have to do it without `<` or it stops rendering AT ALL without any mention :/
 * blocks of code
 * with source recognition / syntax highlighting for various languages
* nice quotes
* ability to style this thing...
* little hassles with managing
* RSS feed 
* Twitter feed
* comments (please no disquss)


> CodrSpace - The blogging platform for coders.

We shall see

### Working with Code then?

Inline:
`markdown right?`

Here is a pre / code combo, but on CodrSpace you won't see it:
<pre>
<code>
public class HelloWorld {

 public static void main(String [] args) {
    System.out.println("Hello World!");
 }
}
</code>
</pre>

<code>
public class HelloWorld {

 public static void main(String [] args) {
    System.out.println("Hello World!");
 }
}
</code>

CodrSpace features for code
[code]

public class HelloWorld {

 public static void main(String [] args) {
    System.out.println("Hello World!");
 }
}
[/code]

And WITH language:
[code lang="java"]

public class HelloWorld {

 public static void main(String [] args) {
    System.out.println("Hello World!");
 }
}
[/code]


CSS from Ghost own starting page:

Via markdown spaces
    .awesome-thing {
        display: block;
        width: 100%;
    }

And via GitHub inline
```css
    .awesome-thing {
        display: block;
        width: 100%;
    }
```

Here is an example of AppleScript, both ways:

    tell application "Foo"
        beep
    end tell

```applescript
    tell application "Foo"
        beep
    end tell
```

So we have source recognition / syntax highlighting.

## Summarizing

Markdown allows HTML so I could have table here, but Codrspace cuts it. :/ But let's try CodrSpace features for code

[code lang="HTML"]
<table border="yes">
<tr>
<th>Need</th>
<th>Platform satisfies?</th>
</tr>
<tr>
<td>markdown</td>
<td>YES</td>
</tr>

<tr>
<td>Asciidoctor</td>
<td>NO</td>
</tr>

<tr>
<td>pushing posts from Vim/Git</td>
<td>YES</td>
</tr>
<tr>
<td>good API from CLI</td>
<td>YES</td>
</tr>

<tr>
<td>post preview as I type</td>
<td>NO</td>
</tr>
<tr>
<td>tags</td>
<td>?</td>
</tr>
<tr>
<td>tag cloud</td>
<td>NO</td>
</tr>
<tr>
<td>handling better than current wordpress.com site</td>
<td>YES</td>
</tr>
<tr>
<td>as nice as I want</td>
<td>NO (Markdown)</td>
</tr>
<tr>
<td>nested lists</td>
<td>NO</td>
</tr>
<tr>
<td>customizable (theme, layout)</td>
<td>NO</td>
</tr>
<tr>
<td>nice quotes</td>
<td>YES</td>
</tr>
<tr>
<td>control over branding</td>
<td>?</td>
</tr>
<tr>
<td>my Twitter feed</td>
<td>?</td>
</tr>
<tr>
<td>little hassles with managing</td>
<td>YES</td>
</tr>
<tr>
<td>RSS feed</td>
<td>?</td>
</tr>
<tr>
<td>free hosting</td>
<td>YES</td>
</tr>
</table>
[/code]

Cons: 6
Pros: 7
?: 4

### Platform specific things
Strong point of CodrSpace is API. Even in alpha, they offer `curl`s to post, access or edit a post.

Not bad, but not what I'm after. 
