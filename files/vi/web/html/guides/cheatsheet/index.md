---
title: Bảng tham chiếu nhanh HTML về cú pháp và các tác vụ thông dụng
short-title: Bảng tham chiếu nhanh
slug: Web/HTML/Guides/Cheatsheet
page-type: guide
sidebar: htmlsidebar
---

Khi làm việc với {{Glossary("HTML")}}, sẽ rất tiện nếu có một cách nhanh chóng để ghi nhớ cách dùng các thẻ HTML đúng cách và cách áp dụng chúng. MDN cung cấp cho bạn [tài liệu tham chiếu HTML](/en-US/docs/Web/HTML/Reference/Elements) đầy đủ cũng như một [bộ hướng dẫn HTML](/en-US/docs/Learn_web_development/Core/Structuring_content) chuyên sâu. Tuy nhiên, trong nhiều trường hợp chúng ta chỉ cần một vài gợi ý nhanh khi làm việc. Đó chính là mục đích của bảng tham chiếu này — cung cấp những đoạn mã sẵn dùng, chính xác và nhanh chóng cho các tình huống phổ biến.

> [!NOTE]
> Các thẻ HTML phải được sử dụng theo giá trị ngữ nghĩa của chúng, không phải theo hình thức hiển thị. Bạn hoàn toàn có thể thay đổi giao diện của một thẻ bất kỳ bằng {{Glossary("CSS")}}, vì vậy khi sử dụng HTML, hãy tập trung vào ý nghĩa thay vì hình thức.

## Phần tử nội tuyến

Một "phần tử" là một thành phần đơn lẻ của trang web. Một số phần tử lớn và chứa các phần tử nhỏ hơn bên trong, giống như các vùng chứa. Một số phần tử nhỏ và được "lồng" bên trong các phần tử lớn hơn. Theo mặc định, "phần tử nội tuyến" xuất hiện cạnh nhau trên một trang web. Chúng chỉ chiếm đúng phần chiều rộng cần thiết và xếp ngang với nhau như các từ trong một câu hoặc những cuốn sách xếp cạnh nhau trên kệ. Tất cả các phần tử nội tuyến đều có thể được đặt bên trong phần tử `<body>`.

<table class="standard-table">
  <caption>Phần tử nội tuyến: cách dùng và ví dụ</caption>
  <thead>
    <tr>
      <th scope="col">Cách dùng</th>
      <th scope="col">Phần tử</th>
      <th scope="col">Ví dụ</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Một liên kết</td>
      <td>{{HTMLElement("a")}}</td>
      <td id="a-example">
        <pre class="brush: html">
&#x3C;a href="https://example.org">
A link to example.org&#x3C;/a>.</pre
        >
        {{EmbedLiveSample("a-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td>Một hình ảnh</td>
      <td>{{HTMLElement("img")}}</td>
      <td id="img-example">
        <pre class="brush: html">&#x3C;img src="beast.png" width="50" /></pre>
        {{EmbedLiveSample("img-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td>Vùng chứa nội tuyến</td>
      <td>{{HTMLElement("span")}}</td>
      <td id="span-example">
        <pre class="brush: html">
Used to group elements: for example,
to &#x3C;span style="color:blue">style
them&#x3C;/span>.</pre
        >
        {{EmbedLiveSample("span-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td>Nhấn mạnh văn bản</td>
      <td>{{HTMLElement("em")}}</td>
      <td id="em-example">
        <pre class="brush: html">&#x3C;em>I'm posh&#x3C;/em>.</pre>
        {{EmbedLiveSample("em-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td>Chữ in nghiêng</td>
      <td>{{HTMLElement("i")}}</td>
      <td id="i-example">
        <pre class="brush: html">
Mark a phrase in &#x3C;i>italics&#x3C;/i>.</pre
        >
        {{EmbedLiveSample("i-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td>Chữ in đậm</td>
      <td>{{HTMLElement("b")}}</td>
      <td id="b-example">
        <pre class="brush: html">Bold &#x3C;b>a word or phrase&#x3C;/b>.</pre>
        {{EmbedLiveSample("b-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td>Văn bản quan trọng</td>
      <td>{{HTMLElement("strong")}}</td>
      <td id="strong-example">
        <pre class="brush: html">&#x3C;strong>I'm important!&#x3C;/strong></pre>
        {{EmbedLiveSample("strong-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td>Tô sáng văn bản</td>
      <td>{{HTMLElement("mark")}}</td>
      <td id="mark-example">
        <pre class="brush: html">&#x3C;mark>Notice me!&#x3C;/mark></pre>
        {{EmbedLiveSample("mark-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td>Văn bản gạch ngang</td>
      <td>{{HTMLElement("s")}}</td>
      <td id="s-example">
        <pre class="brush: html">&#x3C;s>I'm irrelevant.&#x3C;/s></pre>
        {{EmbedLiveSample("s-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td>Chỉ số dưới</td>
      <td>{{HTMLElement("sub")}}</td>
      <td id="sub-example">
        <pre class="brush: html">H&#x3C;sub>2&#x3C;/sub>O</pre>
        {{EmbedLiveSample("sub-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td>Chữ nhỏ</td>
      <td>{{HTMLElement("small")}}</td>
      <td id="small-example">
        <pre class="brush: html">
Used to represent the &#x3C;small>small
print &#x3C;/small>of a document.</pre
        >
        {{EmbedLiveSample("small-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td>Địa chỉ</td>
      <td>{{HTMLElement("address")}}</td>
      <td id="address-example">
        <pre class="brush: html">
&#x3C;address>Main street 67&#x3C;/address></pre
        >
        {{EmbedLiveSample("address-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td>Trích dẫn văn bản</td>
      <td>{{HTMLElement("cite")}}</td>
      <td id="cite-example">
        <pre class="brush: html">
For more monsters,
see &#x3C;cite>The Monster Book of Monsters&#x3C;/cite>.</pre
        >
        {{EmbedLiveSample("cite-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td>Chỉ số trên</td>
      <td>{{HTMLElement("sup")}}</td>
      <td id="sup-example">
        <pre class="brush: html">x&#x3C;sup>2&#x3C;/sup></pre>
        {{EmbedLiveSample("sup-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td>Trích dẫn nội tuyến</td>
      <td>{{HTMLElement("q")}}</td>
      <td id="q-example">
        <pre class="brush: html">&#x3C;q>Me?&#x3C;/q>, she said.</pre>
        {{EmbedLiveSample("q-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td>Ngắt dòng</td>
      <td>{{HTMLElement("br")}}</td>
      <td id="br-example">
        <pre class="brush: html">Line 1&#x3C;br />Line 2</pre>
        {{EmbedLiveSample("br-example", 100, 80)}}
      </td>
    </tr>
    <tr>
      <td>Vị trí ngắt dòng tuỳ chọn</td>
      <td>{{HTMLElement("wbr")}}</td>
      <td id="wbr-example">
        <pre class="brush: html">
&#x3C;div style="width: 200px">
  Llanfair&#x3C;wbr />pwllgwyngyll&#x3C;wbr />gogerychwyrndrobwllllantysiliogogogoch.
&#x3C;/div></pre
        >
        {{EmbedLiveSample("wbr-example", 100, 80)}}
      </td>
    </tr>
    <tr>
      <td>Ngày giờ</td>
      <td>{{HTMLElement("time")}}</td>
      <td id="time-example">
        <pre class="brush: html">
Used to format the date. For example:
&#x3C;time datetime="2020-05-24">
published on 23-05-2020&#x3C;/time>.</pre
        >
        {{EmbedLiveSample("time-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td>Định dạng mã nguồn</td>
      <td>{{HTMLElement("code")}}</td>
      <td id="code-example">
        <pre class="brush: html">
This text is in normal format,
but &#x3C;code>this text is in code
format&#x3C;/code>.</pre
        >
        {{EmbedLiveSample("code-example", 100, 60)}}
      </td>
    </tr>
    <tr>
      <td>Âm thanh</td>
      <td>{{HTMLElement("audio")}}</td>
      <td id="audio-example">
        <pre class="brush: html">
&#x3C;audio controls>
  &#x3C;source src="/shared-assets/audio/t-rex-roar.mp3" type="audio/mpeg" />
&#x3C;/audio>
        </pre>
        {{EmbedLiveSample("audio-example", 100, 80)}}
      </td>
    </tr>
    <tr>
      <td>Video</td>
      <td>{{HTMLElement("video")}}</td>
      <td id="video-example">
        <pre class="brush: html">
&#x3C;video controls width="250"
  src="/shared-assets/videos/flower.webm" >
  &#x3C;a href="/shared-assets/videos/flower.webm">Download WebM video&#x3C;/a>
&#x3C;/video></pre
        >
        {{EmbedLiveSample("video-example", 100, 200)}}
      </td>
    </tr>
  </tbody>
</table>

## Phần tử khối

"Phần tử khối", ngược lại, chiếm toàn bộ chiều rộng của trang web. Chúng cũng chiếm trọn một dòng; chúng không xếp cạnh nhau theo chiều ngang. Thay vào đó, chúng xếp chồng lên nhau như các đoạn văn trong một bài luận hoặc các khối đồ chơi trong một tòa tháp.

> [!NOTE]
> Vì bảng tham chiếu này chỉ giới hạn ở một số phần tử đại diện cho các cấu trúc cụ thể hoặc có ngữ nghĩa đặc biệt, phần tử [`div`](/en-US/docs/Web/HTML/Reference/Elements/div) không được đưa vào một cách có chủ ý — vì phần tử `div` không đại diện cho bất cứ điều gì và không có ngữ nghĩa đặc biệt nào.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Cách dùng</th>
      <th scope="col">Phần tử</th>
      <th scope="col">Ví dụ</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Một đoạn văn đơn giản</td>
      <td>{{HTMLElement("p")}}</td>
      <td id="p-example">
        <pre class="brush: html">
&#x3C;p>I'm a paragraph&#x3C;/p>
&#x3C;p>I'm another paragraph&#x3C;/p></pre
        >
        {{EmbedLiveSample("p-example", 100, 150)}}
      </td>
    </tr>
    <tr>
      <td>Trích dẫn dài</td>
      <td>{{HTMLElement("blockquote")}}</td>
      <td id="blockquote-example">
        <pre class="brush: html">
They said:
&#x3C;blockquote>The blockquote element indicates
an extended quotation.&#x3C;/blockquote></pre
        >
        {{EmbedLiveSample("blockquote-example", 100, 100)}}
      </td>
    </tr>
    <tr>
      <td>Thông tin bổ sung</td>
      <td>{{HTMLElement("details")}}</td>
      <td id="details-example">
        <pre class="brush: html">
&#x3C;details>
  &#x3C;summary>HTML Cheat Sheet&#x3C;/summary>
  &#x3C;p>Inline elements&#x3C;/p>
  &#x3C;p>Block elements&#x3C;/p>
&#x3C;/details></pre
        >
        {{EmbedLiveSample("details-example", 100, 150)}}
      </td>
    </tr>
    <tr>
      <td>Danh sách không có thứ tự</td>
      <td>{{HTMLElement("ul")}}</td>
      <td id="ul-example">
        <pre class="brush: html">&#x3C;ul>
  &#x3C;li>I'm an item&#x3C;/li>
  &#x3C;li>I'm another item&#x3C;/li>
&#x3C;/ul></pre>
        {{EmbedLiveSample("ul-example", 100, 100)}}
      </td>
    </tr>
    <tr>
      <td>Danh sách có thứ tự</td>
      <td>{{HTMLElement("ol")}}</td>
      <td id="ol-example">
        <pre class="brush: html">&#x3C;ol>
  &#x3C;li>I'm the first item&#x3C;/li>
  &#x3C;li>I'm the second item&#x3C;/li>
&#x3C;/ol></pre>
        {{EmbedLiveSample("ol-example", 100, 100)}}
      </td>
    </tr>
    <tr>
      <td>Danh sách định nghĩa</td>
      <td>{{HTMLElement("dl")}}</td>
      <td id="dl-example">
        <pre class="brush: html">&#x3C;dl>
  &#x3C;dt>A Term&#x3C;/dt>
  &#x3C;dd>Definition of a term&#x3C;/dd>
  &#x3C;dt>Another Term&#x3C;/dt>
  &#x3C;dd>Definition of another term&#x3C;/dd>
&#x3C;/dl></pre>
        {{EmbedLiveSample("dl-example", 100, 150)}}
      </td>
    </tr>
    <tr>
      <td>Đường kẻ ngang</td>
      <td>{{HTMLElement("hr")}}</td>
      <td id="hr-example">
        <pre class="brush: html">before&#x3C;hr />after</pre>
        {{EmbedLiveSample("hr-example", 100, 100)}}
      </td>
    </tr>
    <tr>
      <td>Tiêu đề văn bản</td>
      <td>
        {{HTMLElement("Heading_Elements", "&lt;h1&gt;-&lt;h6&gt;")}}
      </td>
      <td id="h1-h6-example">
        <pre class="brush: html">
&#x3C;h1> This is Heading 1 &#x3C;/h1>
&#x3C;h2> This is Heading 2 &#x3C;/h2>
&#x3C;h3> This is Heading 3 &#x3C;/h3>
&#x3C;h4> This is Heading 4 &#x3C;/h4>
&#x3C;h5> This is Heading 5 &#x3C;/h5>
&#x3C;h6> This is Heading 6 &#x3C;/h6></pre
        >
        {{EmbedLiveSample("h1-h6-example", 100, 350)}}
      </td>
    </tr>
  </tbody>
</table>
