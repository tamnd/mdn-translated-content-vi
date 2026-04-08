---
title: Content categories
slug: Web/HTML/Guides/Content_categories
page-type: guide
sidebar: htmlsidebar
---

Hầu hết các phần tử [HTML](/en-US/docs/Web/HTML) đều thuộc một hoặc nhiều **danh mục nội dung** — các danh mục này nhóm các phần tử có chung đặc điểm. Đây là một nhóm lỏng lẻo (nó không thực sự tạo ra mối quan hệ giữa các phần tử trong các danh mục này), nhưng chúng giúp xác định và mô tả hành vi chung của các danh mục và các quy tắc liên quan. Một phần tử có thể [không thuộc _bất kỳ_ danh mục nào trong số này](#elements_without_a_category).

Các danh mục nội dung được sử dụng để xác định _content model_ (mô hình nội dung) của các phần tử, nói cách khác, mỗi phần tử có thể nhận những phần tử con nào. Ví dụ, phần tử `<p>` chỉ có thể chứa _phrasing content_, trong khi phần tử `<div>` có thể chứa _flow content_. Một số phần tử, như `<ins>`, có [_transparent_ content model](#transparent_content_model).

Có bảy danh mục nội dung chính, có thể tóm tắt bằng sơ đồ Venn dưới đây:

![A Venn diagram showing how the various content categories interrelate. The following sections explain these relationships in text.](content_categories_venn.png)

> [!NOTE]
> Một thảo luận chi tiết hơn về các danh mục nội dung này và các chức năng so sánh của chúng nằm ngoài phạm vi của bài viết này; để biết thêm, bạn có thể muốn đọc [các phần liên quan của đặc tả HTML](https://html.spec.whatwg.org/multipage/dom.html#kinds-of-content).

## Metadata content

Các phần tử thuộc danh mục _metadata content_ sửa đổi cách trình bày hoặc hành vi của phần còn lại của tài liệu, thiết lập liên kết đến các tài liệu khác, hoặc truyền tải các thông tin _out-of-band_ khác. Mọi thứ trong {{htmlelement("head")}}, bao gồm `<title>`, `<link>`, `<script>`, `<style>`, và `<base>` ít được sử dụng hơn, đều là metadata content. Có một phần tử `<meta>` dành cho metadata không thể được biểu diễn bởi các phần tử khác này.

Các phần tử metadata bao gồm:

- {{HTMLElement("base")}}
- {{HTMLElement("link")}}
- {{HTMLElement("meta")}}
- {{HTMLElement("noscript")}}
- {{HTMLElement("script")}}
- {{HTMLElement("style")}}
- {{HTMLElement("template")}}
- {{HTMLElement("title")}}

Một số phần tử này thuộc nhiều hơn một danh mục nội dung. Ví dụ, `<script>` là thành viên của danh mục metadata, flow và phrasing content, và là phần tử hỗ trợ script; `<script>` có thể được sử dụng ở những nơi mong đợi metadata content, phrasing content, hoặc các phần tử hỗ trợ script.

## Flow content

Flow content là một danh mục rộng bao gồm hầu hết các phần tử có thể nằm bên trong phần tử {{HTMLElement("body")}}, bao gồm các phần tử heading, sectioning, phrasing, embedding, interactive, và liên quan đến biểu mẫu. Nó cũng bao gồm các text node (nhưng không phải những node chỉ bao gồm các ký tự khoảng trắng).

Các phần tử flow bao gồm:

- {{HTMLElement("a")}}
- {{HTMLElement("abbr")}}
- {{HTMLElement("address")}}
- {{HTMLElement("article")}}
- {{HTMLElement("aside")}}
- {{HTMLElement("audio")}}
- {{HTMLElement("b")}}
- {{HTMLElement("bdi")}}
- {{HTMLElement("bdo")}}
- {{HTMLElement("blockquote")}}
- {{HTMLElement("br")}}
- {{HTMLElement("button")}}
- {{HTMLElement("canvas")}}
- {{HTMLElement("cite")}}
- {{HTMLElement("code")}}
- {{HTMLElement("data")}}
- {{HTMLElement("datalist")}}
- {{HTMLElement("del")}}
- {{HTMLElement("details")}}
- {{HTMLElement("dfn")}}
- {{HTMLElement("dialog")}}
- {{HTMLElement("div")}}
- {{HTMLElement("dl")}}
- {{HTMLElement("em")}}
- {{HTMLElement("embed")}}
- {{HTMLElement("fieldset")}}
- {{HTMLElement("figure")}}
- {{HTMLElement("footer")}}
- {{HTMLElement("form")}}
- {{HTMLElement("geolocation")}}
- {{HTMLElement("Heading_Elements", "<code>&lt;h1&gt;</code>-<code>&lt;h6&gt;</code>")}}
- {{HTMLElement("header")}}
- {{HTMLElement("hgroup")}}
- {{HTMLElement("hr")}}
- {{HTMLElement("i")}}
- {{HTMLElement("iframe")}}
- {{HTMLElement("img")}}
- {{HTMLElement("input")}}
- {{HTMLElement("ins")}}
- {{HTMLElement("kbd")}}
- {{HTMLElement("label")}}
- {{HTMLElement("main")}}
- {{HTMLElement("map")}}
- {{HTMLElement("mark")}}
- {{MathMLElement("math")}}
- {{HTMLElement("menu")}}
- {{HTMLElement("meter")}}
- {{HTMLElement("nav")}}
- {{HTMLElement("noscript")}}
- {{HTMLElement("object")}}
- {{HTMLElement("ol")}}
- {{HTMLElement("output")}}
- {{HTMLElement("p")}}
- {{HTMLElement("picture")}}
- {{HTMLElement("pre")}}
- {{HTMLElement("progress")}}
- {{HTMLElement("q")}}
- {{HTMLElement("ruby")}}
- {{HTMLElement("s")}}
- {{HTMLElement("samp")}}
- {{HTMLElement("script")}}
- {{HTMLElement("search")}}
- {{HTMLElement("section")}}
- {{HTMLElement("select")}}
- {{HTMLElement("slot")}}
- {{HTMLElement("small")}}
- {{HTMLElement("span")}}
- {{HTMLElement("strong")}}
- {{HTMLElement("sub")}}
- {{HTMLElement("sup")}}
- {{SVGElement("svg")}}
- {{HTMLElement("table")}}
- {{HTMLElement("template")}}
- {{HTMLElement("textarea")}}
- {{HTMLElement("time")}}
- {{HTMLElement("u")}}
- {{HTMLElement("ul")}}
- {{HTMLElement("var")}}
- {{HTMLElement("video")}}
- {{HTMLElement("wbr")}}
- [Autonomous custom elements](/en-US/docs/Web/API/Web_components/Using_custom_elements)
- Plain text

Một số phần tử khác thuộc danh mục này, nhưng chỉ khi một điều kiện cụ thể được đáp ứng:

- {{HTMLElement("area")}}, nếu nó là phần tử con của phần tử {{HTMLElement("map")}}
- {{HTMLElement("link")}}, nếu thuộc tính [`itemprop`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemprop) có mặt
- {{HTMLElement("meta")}}, nếu thuộc tính [`itemprop`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemprop) có mặt

## Sectioning content

Sectioning content, một tập hợp con của flow content, tạo ra một [phần trong outline hiện tại](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) xác định phạm vi của các phần tử {{HTMLElement("header")}} và {{HTMLElement("footer")}}.

Các phần tử sectioning bao gồm:

- {{HTMLElement("article")}}
- {{HTMLElement("aside")}}
- {{HTMLElement("nav")}}
- {{HTMLElement("section")}}

## Heading content

Heading content, một tập hợp con của flow content, xác định tiêu đề của một phần. Định nghĩa này áp dụng cho cả các phần được đánh dấu bằng các phần tử [sectioning content](#sectioning_content) rõ ràng và những phần được định nghĩa ngầm bởi chính heading content.

Các phần tử heading bao gồm:

- {{HTMLElement("Heading_Elements", "<code>&lt;h1&gt;</code>-<code>&lt;h6&gt;</code>")}}
- {{HTMLElement("hgroup")}}

> [!NOTE]
> Mặc dù có thể chứa heading content, {{HTMLElement("header")}} không phải là heading content.

## Phrasing content

Phrasing content, một tập hợp con của flow content, đề cập đến văn bản và đánh dấu trong một tài liệu. Các chuỗi phrasing content tạo thành các đoạn văn.

Các phần tử phrasing bao gồm:

- {{HTMLElement("abbr")}}
- {{HTMLElement("audio")}}
- {{HTMLElement("b")}}
- {{HTMLElement("bdi")}}
- {{HTMLElement("bdo")}}
- {{HTMLElement("br")}}
- {{HTMLElement("button")}}
- {{HTMLElement("canvas")}}
- {{HTMLElement("cite")}}
- {{HTMLElement("code")}}
- {{HTMLElement("data")}}
- {{HTMLElement("datalist")}}
- {{HTMLElement("dfn")}}
- {{HTMLElement("em")}}
- {{HTMLElement("embed")}}
- {{HTMLElement("i")}}
- {{HTMLElement("iframe")}}
- {{HTMLElement("img")}}
- {{HTMLElement("input")}}
- {{HTMLElement("kbd")}}
- {{HTMLElement("label")}}
- {{HTMLElement("mark")}}
- {{MathMLElement("math")}}
- {{HTMLElement("meter")}}
- {{HTMLElement("noscript")}}
- {{HTMLElement("object")}}
- {{HTMLElement("output")}}
- {{HTMLElement("picture")}}
- {{HTMLElement("progress")}}
- {{HTMLElement("q")}}
- {{HTMLElement("ruby")}}
- {{HTMLElement("s")}}
- {{HTMLElement("samp")}}
- {{HTMLElement("script")}}
- {{HTMLElement("select")}}
- {{HTMLElement("slot")}}
- {{HTMLElement("small")}}
- {{HTMLElement("span")}}
- {{HTMLElement("strong")}}
- {{HTMLElement("sub")}}
- {{HTMLElement("sup")}}
- {{SVGElement("svg")}}
- {{HTMLElement("template")}}
- {{HTMLElement("textarea")}}
- {{HTMLElement("time")}}
- {{HTMLElement("u")}}
- {{HTMLElement("var")}}
- {{HTMLElement("video")}}
- {{HTMLElement("wbr")}}
- [Autonomous custom elements](/en-US/docs/Web/API/Web_components/Using_custom_elements)
- Plain text

Một số phần tử khác thuộc danh mục này, nhưng chỉ khi một điều kiện cụ thể được đáp ứng:

- {{HTMLElement("a")}}, nếu nó chỉ chứa phrasing content
- {{HTMLElement("area")}}, nếu nó là phần tử con của phần tử {{HTMLElement("map")}}
- {{HTMLElement("del")}}, nếu nó chỉ chứa phrasing content
- {{HTMLElement("ins")}}, nếu nó chỉ chứa phrasing content
- {{HTMLElement("link")}}, nếu thuộc tính [`itemprop`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemprop) có mặt
- {{HTMLElement("map")}}, nếu nó chỉ chứa phrasing content
- {{HTMLElement("meta")}}, nếu thuộc tính [`itemprop`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemprop) có mặt

## Embedded content

Embedded content, một tập hợp con của flow content, nhập một tài nguyên khác hoặc chèn nội dung từ ngôn ngữ đánh dấu hoặc namespace khác vào tài liệu.

Các phần tử embedded content bao gồm:

- {{HTMLElement("audio")}}
- {{HTMLElement("canvas")}}
- {{HTMLElement("embed")}}
- {{HTMLElement("iframe")}}
- {{HTMLElement("img")}}
- {{MathMLElement("math")}}
- {{HTMLElement("object")}}
- {{HTMLElement("picture")}}
- {{SVGElement("svg")}}
- {{HTMLElement("video")}}

## Interactive content

Interactive content, một tập hợp con của flow content, bao gồm các phần tử được thiết kế đặc biệt để người dùng tương tác.

Các phần tử interactive content bao gồm:

- {{HTMLElement("button")}}
- {{HTMLElement("details")}}
- {{HTMLElement("embed")}}
- {{HTMLElement("iframe")}}
- {{HTMLElement("label")}}
- {{HTMLElement("select")}}
- {{HTMLElement("textarea")}}

Một số phần tử thuộc danh mục này chỉ trong các điều kiện cụ thể:

- {{HTMLElement("a")}}, nếu thuộc tính [`href`](/en-US/docs/Web/HTML/Reference/Elements/a#href) có mặt
- {{HTMLElement("audio")}}, nếu thuộc tính [`controls`](/en-US/docs/Web/HTML/Reference/Elements/audio#controls) có mặt
- {{HTMLElement("img")}}, nếu thuộc tính [`usemap`](/en-US/docs/Web/HTML/Reference/Elements/img#usemap) có mặt
- {{HTMLElement("input")}}, nếu thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) không ở trạng thái hidden
- {{HTMLElement("object")}}, nếu thuộc tính [`usemap`](/en-US/docs/Web/HTML/Reference/Elements/object#usemap) có mặt
- {{HTMLElement("video")}}, nếu thuộc tính [`controls`](/en-US/docs/Web/HTML/Reference/Elements/video#controls) có mặt

## Palpable content

**Palpable content** là nội dung không rỗng và không ẩn; đó là nội dung được render và có chất lượng. Palpable content không được sử dụng để định nghĩa các content model mà được sử dụng để định nghĩa một quy tắc chung: Các phần tử có content model cho phép bất kỳ flow content hoặc phrasing content nên có ít nhất một node trong nội dung của nó là palpable content và không có thuộc tính `hidden` được chỉ định.

Các phần tử palpable bao gồm:

- {{HTMLElement("a")}}
- {{HTMLElement("abbr")}}
- {{HTMLElement("address")}}
- {{HTMLElement("article")}}
- {{HTMLElement("aside")}}
- {{HTMLElement("b")}}
- {{HTMLElement("bdi")}}
- {{HTMLElement("bdo")}}
- {{HTMLElement("blockquote")}}
- {{HTMLElement("button")}}
- {{HTMLElement("canvas")}}
- {{HTMLElement("cite")}}
- {{HTMLElement("code")}}
- {{HTMLElement("data")}}
- {{HTMLElement("del")}}
- {{HTMLElement("details")}}
- {{HTMLElement("dfn")}}
- {{HTMLElement("div")}}
- {{HTMLElement("em")}}
- {{HTMLElement("embed")}}
- {{HTMLElement("fieldset")}}
- {{HTMLElement("footer")}}
- {{HTMLElement("figure")}}
- {{HTMLElement("form")}}
- {{HtmlElement("iframe")}}
- {{HtmlElement("img")}}
- {{HtmlElement("ins")}}
- {{HtmlElement("kbd")}}
- {{HtmlElement("label")}}
- {{HtmlElement("main")}}
- {{HtmlElement("map")}}
- {{HtmlElement("mark")}}
- {{MathMLElement("math")}}
- {{HtmlElement("meter")}}
- {{HtmlElement("nav")}}
- {{HtmlElement("object")}}
- {{HtmlElement("p")}}
- {{HtmlElement("picture")}}
- {{HtmlElement("pre")}}
- {{HtmlElement("progress")}}
- {{HtmlElement("q")}}
- {{HtmlElement("ruby")}}
- {{HtmlElement("s")}}
- {{HtmlElement("samp")}}
- {{HtmlElement("search")}}
- {{HtmlElement("section")}}
- {{HtmlElement("select")}}
- {{HtmlElement("small")}}
- {{HtmlElement("span")}}
- {{HtmlElement("strong")}}
- {{HtmlElement("sub")}}
- {{HtmlElement("sup")}}
- {{SVGElement("svg")}}
- {{HtmlElement("table")}}
- {{HtmlElement("textarea")}}
- {{HtmlElement("time")}}
- {{HtmlElement("u")}}
- {{HtmlElement("var")}}
- {{HtmlElement("video")}}
- [Autonomous custom elements](/en-US/docs/Web/API/Web_components/Using_custom_elements)
- Plain text không phải là [khoảng trắng](/en-US/docs/Glossary/Whitespace) giữa các phần tử

Một số phần tử thuộc danh mục này chỉ trong các điều kiện cụ thể:

- {{HTMLElement("audio")}}, nếu thuộc tính [`controls`](/en-US/docs/Web/HTML/Reference/Elements/audio#controls) có mặt
- {{HTMLElement("dl")}}, nếu các phần tử con của phần tử bao gồm ít nhất một nhóm tên-giá trị
- {{HTMLElement("input")}}, nếu thuộc tính [type](/en-US/docs/Web/HTML/Reference/Elements/input#type) không ở trạng thái hidden
- {{HTMLElement("ol")}}, nếu các phần tử con bao gồm ít nhất một phần tử {{HTMLElement("li")}}
- {{HTMLElement("ul")}}, nếu các phần tử con bao gồm ít nhất một phần tử {{HTMLElement("li")}}

## Các phần tử không có danh mục

Một số phần tử không thuộc _bất kỳ_ danh mục nội dung nào. Bao gồm:

- {{HTMLElement("caption")}}
- {{HTMLElement("col")}}
- {{HTMLElement("colgroup")}}
- {{HTMLElement("dd")}}
- {{HTMLElement("dt")}}
- {{HTMLElement("figcaption")}}
- {{HTMLElement("head")}}
- {{HTMLElement("html")}}
- {{HTMLElement("legend")}}
- {{HTMLElement("li")}}
- {{HTMLElement("optgroup")}}
- {{HTMLElement("option")}}
- {{HTMLElement("param")}}
- {{HTMLElement("rb")}}
- {{HTMLElement("rp")}}
- {{HTMLElement("rt")}}
- {{HTMLElement("rtc")}}
- {{HTMLElement("source")}}
- {{HTMLElement("tbody")}}
- {{HTMLElement("tfoot")}}
- {{HTMLElement("th")}}
- {{HTMLElement("thead")}}
- {{HTMLElement("tr")}}
- {{HTMLElement("track")}}

## Các phần tử hỗ trợ script

**Các phần tử hỗ trợ script** là các phần tử không đóng góp trực tiếp vào đầu ra được render của tài liệu. Thay vào đó, chúng phục vụ để hỗ trợ script, bằng cách chứa hoặc chỉ định mã script trực tiếp hoặc bằng cách chỉ định dữ liệu sẽ được script sử dụng. Hầu hết tất cả các phần tử, bao gồm cả những phần tử chỉ nhận các phần tử cụ thể (như {{HTMLElement("ul")}}, nhận các phần tử {{HTMLElement("li")}}), đều có thể chứa các phần tử hỗ trợ script.

Các phần tử hỗ trợ script bao gồm:

- {{HTMLElement("script")}}
- {{HTMLElement("template")}}

## Form-associated content

Form-associated content là một tập hợp con của flow content bao gồm các phần tử có form owner và có thể được sử dụng ở bất kỳ đâu flow content được mong đợi. Form owner là phần tử {{HTMLElement("form")}} chứa nó hoặc `<form>` có `id` được chỉ định trong thuộc tính `form` của phần tử.

Các phần tử form-associated bao gồm:

- {{HTMLElement("button")}}
- {{HTMLElement("fieldset")}}
- {{HTMLElement("input")}}
- {{HTMLElement("object")}}
- {{HTMLElement("output")}}
- {{HTMLElement("select")}}
- {{HTMLElement("textarea")}}
- {{HTMLElement("img")}}

Danh mục này chứa một số danh mục con:

- listed
  - : Các phần tử được liệt kê trong các tập hợp {{domxref("HTMLFormElement.elements")}} và {{domxref("HTMLFieldSetElement.elements")}}. Bao gồm {{HTMLElement("button")}}, {{HTMLElement("fieldset")}}, {{HTMLElement("input")}}, {{HTMLElement("object")}}, {{HTMLElement("output")}}, {{HTMLElement("select")}}, và {{HTMLElement("textarea")}}.
- submittable
  - : Các phần tử có thể được sử dụng để xây dựng tập dữ liệu biểu mẫu khi biểu mẫu được gửi. Bao gồm {{HTMLElement("button")}}, {{HTMLElement("input")}}, {{HTMLElement("select")}}, và {{HTMLElement("textarea")}}.
- resettable
  - : Các phần tử có thể bị ảnh hưởng khi biểu mẫu được reset. Bao gồm {{HTMLElement("input")}}, {{HTMLElement("output")}}, {{HTMLElement("select")}}, và {{HTMLElement("textarea")}}.
- autocapitalize-and-autocorrect-inheriting
  - : Các phần tử kế thừa các thuộc tính [`autocapitalize`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocapitalize) và [`autocorrect`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocorrect) từ form owner. Bao gồm {{HTMLElement("button")}}, {{HTMLElement("fieldset")}}, {{HTMLElement("input")}}, {{HTMLElement("output")}}, {{HTMLElement("select")}}, và {{HTMLElement("textarea")}}.
- labelable
  - : Các phần tử có thể được liên kết với các phần tử {{HTMLElement("label")}}. Bao gồm {{HTMLElement("button")}}, {{HTMLElement("input")}} (tất cả các loại ngoại trừ `hidden`), {{HTMLElement("meter")}}, {{HTMLElement("output")}}, {{HTMLElement("progress")}}, {{HTMLElement("select")}}, và {{HTMLElement("textarea")}}.

## Transparent content model

Ngoài các danh mục nội dung được liệt kê, content model của một phần tử cũng có thể được định nghĩa là "transparent". Nếu nội dung được phép của phần tử X là "transparent", thì chúng ta nhìn vào phần tử cha của X. Chúng ta lấy giao điểm của nội dung được phép của cha X với các danh mục nội dung của X, và kết quả là ý nghĩa của "transparent" trong ngữ cảnh này. Nếu cha của X cũng có transparent content model, thì chúng ta tiếp tục đi lên cây cho đến khi tìm thấy một content model không transparent. Khi không có cha như vậy, "transparent" có nghĩa là "flow content".

Ví dụ, một phần tử {{HTMLElement("ruby")}} chấp nhận phrasing content. Phần tử {{HTMLElement("ins")}} thuộc danh mục phrasing content khi nó chỉ chứa phrasing content. Do đó, một phần tử {{HTMLElement("ins")}} có thể được đặt bên trong một phần tử {{HTMLElement("ruby")}}. Nội dung được phép của phần tử `<ins>` là "transparent", khi được lồng trong `<ruby>` có nghĩa là "phrasing content". Tuy nhiên, các phần tử {{HTMLElement("rt")}} không phải là phrasing content. Do đó, một phần tử {{HTMLElement("rt")}} không thể được lồng bên trong phần tử `<ins>` này, mặc dù cả `<rt>` và `<ins>` đều có thể nằm trong `<ruby>`, và `<ins>` là "transparent".

```html example-bad
<ruby>
  Text before
  <ins>
    <!-- Invalid: rt cannot be placed inside ins here -->
    <rt>Pronunciation</rt>
  </ins>
</ruby>
```

```html example-good
<ruby>
  Text before
  <!-- Valid: ins can be inside ruby, and rt can be inside ruby -->
  <ins>Inserted text</ins>
  <rt>Pronunciation</rt>
</ruby>
```

```html example-good
<ruby>
  Text before
  <!-- Valid: rt can be inside ruby, and ins can be inside rt -->
  <rt><ins>Pronunciation</ins></rt>
</ruby>
```

Transparent là một _content model_, không phải một _content category_, vì vậy nó chỉ định nghĩa những gì một phần tử có thể chứa, không phải nơi phần tử có thể được đặt. Nghĩa là, khi xác định tính hợp lệ của các phần tử con, bạn không thể "nhìn xuyên qua" các phần tử con transparent. Ví dụ, một phần tử {{HTMLElement("ul")}} chỉ chấp nhận các phần tử {{HTMLElement("li")}} và các phần tử hỗ trợ script, và không cho phép `<del>` hay `<ins>`, ngay cả khi `<del>` chỉ chứa các phần tử `<li>`.

```html example-bad
<ul>
  <del>
    <li>Oranges</li>
    <li>Toilet paper</li>
  </del>
  <li>Toothpaste</li>
</ul>
```

```html example-good
<ul>
  <li><del>Oranges</del></li>
  <li><del>Toilet paper</del></li>
  <li>Toothpaste</li>
</ul>
```
