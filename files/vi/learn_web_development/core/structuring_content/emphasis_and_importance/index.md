---
title: Nhấn mạnh và tầm quan trọng
slug: Learn_web_development/Core/Structuring_content/Emphasis_and_importance
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Headings_and_paragraphs", "Learn_web_development/Core/Structuring_content/Lists", "Learn_web_development/Core/Structuring_content")}}

Bài viết trước đã xem xét lý do tại sao ngữ nghĩa quan trọng trong HTML, và tập trung vào các tiêu đề và đoạn văn. Bài viết này tiếp tục chủ đề về ngữ nghĩa, xem xét các phần tử HTML áp dụng sự nhấn mạnh và tầm quan trọng cho văn bản (tương đương với chữ nghiêng và chữ đậm trong phương tiện in).

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với HTML, như đã được đề cập trong
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Ý nghĩa của sự nhấn mạnh và tầm quan trọng, và các phần tử cơ bản áp dụng chúng trong HTML, như <code>&lt;em&gt;</code> và <code>&lt;strong&gt;</code>.</li>
          <li>Xác định đánh dấu trình bày không còn được sử dụng nữa (ví dụ: <code>&lt;big&gt;</code> và <code>&lt;font&gt;</code>); nó đã lỗi thời.</li>
          <li>Xác định đánh dấu trình bày đã được tái sử dụng để có ý nghĩa ngữ nghĩa mới (ví dụ: <code>&lt;i&gt;</code> và <code>&lt;b&gt;</code>).</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Nhấn mạnh và tầm quan trọng là gì?

Trong ngôn ngữ của con người, chúng ta thường nhấn mạnh các từ nhất định để thay đổi ý nghĩa của câu, và chúng ta thường muốn đánh dấu một số từ là quan trọng hoặc khác biệt theo một cách nào đó. HTML cung cấp nhiều phần tử ngữ nghĩa khác nhau để cho phép chúng ta đánh dấu nội dung văn bản với các hiệu ứng như vậy, và trong phần này, chúng ta sẽ xem xét một vài trong số những phần tử phổ biến nhất.

### Nhấn mạnh

Khi chúng ta muốn thêm sự nhấn mạnh trong ngôn ngữ nói, chúng ta _nhấn mạnh_ các từ nhất định, thay đổi tinh tế ý nghĩa của những gì chúng ta đang nói. Tương tự, trong ngôn ngữ viết chúng ta có xu hướng nhấn mạnh các từ bằng cách in nghiêng chúng. Ví dụ, hai câu sau có các ý nghĩa khác nhau.

> I am glad you weren't late.
>
> I am _glad_ you weren't _late_.

Câu đầu tiên nghe như thực sự nhẹ nhõm rằng người đó không đến muộn. Ngược lại, câu thứ hai, với cả hai từ "glad" và "late" in nghiêng, nghe có vẻ mỉa mai hoặc thụ động-hung hăng, thể hiện sự khó chịu khi người đó đến hơi muộn.

Trong HTML chúng ta sử dụng phần tử {{htmlelement("em")}} (nhấn mạnh) để đánh dấu các trường hợp như vậy. Ngoài việc làm cho tài liệu thú vị hơn để đọc, những điều này được các trình đọc màn hình nhận biết, có thể được cấu hình để nói chúng với giọng điệu khác. Các trình duyệt tạo kiểu này là chữ nghiêng theo mặc định, nhưng bạn không nên sử dụng thẻ này chỉ để có kiểu chữ nghiêng. Để làm điều đó, bạn sẽ sử dụng phần tử {{htmlelement("span")}} và một số CSS, hoặc có thể là phần tử {{htmlelement("i")}} (xem bên dưới).

```html
<p>I am <em>glad</em> you weren't <em>late</em>.</p>
```

### Tầm quan trọng mạnh

Để nhấn mạnh các từ quan trọng, chúng ta có xu hướng nhấn mạnh chúng trong ngôn ngữ nói và in **đậm** chúng trong ngôn ngữ viết. Ví dụ:

> This liquid is **highly toxic**.
>
> I am counting on you. **Do not** be late!

Trong HTML chúng ta sử dụng phần tử {{htmlelement("strong")}} (tầm quan trọng mạnh) để đánh dấu các trường hợp như vậy. Ngoài việc làm cho tài liệu hữu ích hơn, một lần nữa những điều này được các trình đọc màn hình nhận biết, có thể được cấu hình để nói chúng với giọng điệu khác. Các trình duyệt tạo kiểu này là chữ đậm theo mặc định, nhưng bạn không nên sử dụng thẻ này chỉ để có kiểu chữ đậm. Để làm điều đó, bạn sẽ sử dụng phần tử {{htmlelement("span")}} và một số CSS, hoặc có thể là phần tử {{htmlelement("b")}} (xem bên dưới).

```html
<p>This liquid is <strong>highly toxic</strong>.</p>

<p>I am counting on you. <strong>Do not</strong> be late!</p>
```

Bạn có thể lồng strong và emphasis vào nhau nếu muốn:

```html-nolint
<p>This liquid is <strong>highly toxic</strong> — if you drink it, <strong>you may <em>die</em></strong>.</p>
```

{{EmbedLiveSample('Strong importance')}}

## Hãy thử nghiệm với nhấn mạnh và tầm quan trọng

Trong phần này, chúng tôi muốn bạn thử nghiệm với nhấn mạnh và tầm quan trọng:

1. Nhấp **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Trong tiêu đề chính, hãy nhấn mạnh từ "Emphasis" và cho từ "importance" tầm quan trọng mạnh.
3. Trong đoạn văn đầu tiên, hãy cho tên máy pha cà phê tầm quan trọng mạnh, và nhấn mạnh các tính từ dùng để mô tả cà phê.
4. Trong đoạn văn thứ hai, hãy cho mô tả nhiệt độ ("cold") và hành động bạn nên thực hiện ("wrap up warm to avoid falling ill") tầm quan trọng mạnh. Hãy thêm một số đánh dấu cho "falling ill" để nó vừa được nhấn mạnh vừa quan trọng.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng cách sử dụng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị kẹt, bạn có thể xem giải pháp bên dưới khối mã.

```css hidden live-sample___emphasis_importance
h1 {
  font-weight: normal;
}
```

```html live-sample___emphasis_importance
<h1>Emphasis and importance</h1>

<p>
  My new coffee machine is called The Percolator 2000. It produces the most
  sublime and wonderful brew.
</p>

<p>
  In the dead of winter, it will be cold. You should wrap up warm to avoid
  falling ill.
</p>
```

{{ EmbedLiveSample('emphasis_importance', "100%", 160) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html
<h1><em>Emphasis</em> and <strong>importance</strong></h1>

<p>
  My new coffee machine is called <strong>The Percolator 2000</strong>. It
  produces the most <em>sublime</em> and <em>wonderful</em> brew.
</p>

<p>
  In the dead of winter, it will be <strong>cold</strong>. You should
  <strong>wrap up warm to avoid <em>falling ill</em></strong
  >.
</p>
```

</details>

## Chữ nghiêng, chữ đậm, gạch chân…

Các phần tử chúng ta đã thảo luận cho đến nay có ngữ nghĩa liên quan rõ ràng. Tình huống với {{htmlelement("b")}}, {{htmlelement("i")}}, và {{htmlelement("u")}} phức tạp hơn một chút. Chúng xuất hiện để mọi người có thể viết chữ đậm, chữ nghiêng hoặc gạch chân trong thời đại khi CSS vẫn còn được hỗ trợ kém hoặc hoàn toàn không. Các phần tử như thế này, chỉ ảnh hưởng đến trình bày chứ không phải ngữ nghĩa, được gọi là **phần tử trình bày** và không còn nên được sử dụng vì, như chúng ta đã thấy, ngữ nghĩa rất quan trọng đối với khả năng tiếp cận, SEO, v.v.

HTML5 đã định nghĩa lại `<b>`, `<i>` và `<u>` với các vai trò ngữ nghĩa mới, hơi khó hiểu.

Đây là quy tắc tốt nhất bạn có thể nhớ: Chỉ thích hợp sử dụng `<b>`, `<i>`, hoặc `<u>` để truyền đạt ý nghĩa truyền thống được truyền đạt bằng chữ đậm, chữ nghiêng hoặc gạch chân khi không có phần tử phù hợp hơn; và thường có. Hãy xem xét liệu `<strong>`, `<em>`, `<mark>`, hoặc `<span>` có thể phù hợp hơn không.

Luôn giữ tư duy về khả năng tiếp cận. Khái niệm chữ nghiêng không hữu ích lắm đối với những người sử dụng trình đọc màn hình, hoặc đối với những người sử dụng hệ thống chữ viết khác ngoài bảng chữ cái Latin.

- {{HTMLElement('i')}} được sử dụng để truyền đạt ý nghĩa truyền thống được truyền đạt bằng chữ nghiêng: từ nước ngoài, chỉ định phân loại, thuật ngữ kỹ thuật, suy nghĩ…
- {{HTMLElement('b')}} được sử dụng để truyền đạt ý nghĩa truyền thống được truyền đạt bằng chữ đậm: từ khóa, tên sản phẩm, câu dẫn đầu…
- {{HTMLElement('u')}} được sử dụng để truyền đạt ý nghĩa truyền thống được truyền đạt bằng gạch chân: tên riêng, lỗi chính tả…

> [!NOTE]
> Mọi người thường liên kết gạch chân với siêu liên kết. Do đó, trên web, tốt nhất là chỉ gạch chân các liên kết. Sử dụng phần tử `<u>` khi nó phù hợp về mặt ngữ nghĩa, nhưng hãy cân nhắc sử dụng CSS để thay đổi gạch chân mặc định thành điều gì đó phù hợp hơn trên web. Ví dụ dưới đây minh họa cách nó có thể được thực hiện.

<!-- cSpell:ignore spel -->

```html
<!-- scientific names -->
<p>
  The Ruby-throated Hummingbird (<i>Archilochus colubris</i>) is the most common
  hummingbird in Eastern North America.
</p>

<!-- foreign words -->
<p>
  The menu was a sea of exotic words like <i lang="uk-latn">vatrushka</i>,
  <i lang="id">nasi goreng</i> and <i lang="fr">soupe à l'oignon</i>.
</p>

<!-- a known misspelling -->
<p>Someday I'll learn how to <u class="spelling-error">spel</u> better.</p>

<!-- term being defined when used in a definition -->
<dl>
  <dt>Semantic HTML</dt>
  <dd>
    Use the elements based on their <b>semantic</b> meaning, not their
    appearance.
  </dd>
</dl>
```

{{EmbedLiveSample('Italic, bold, underline…','100%','270')}}

## Tóm tắt

Chúng ta đã hoàn thành việc xem xét sự nhấn mạnh và tầm quan trọng cho đến nay. Hãy chuyển sang xem xét cách chúng ta biểu diễn danh sách trong HTML.

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Headings_and_paragraphs", "Learn_web_development/Core/Structuring_content/Lists", "Learn_web_development/Core/Structuring_content")}}
