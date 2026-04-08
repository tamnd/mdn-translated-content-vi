---
title: HTML title global attribute
short-title: title
slug: Web/HTML/Reference/Global_attributes/title
page-type: html-attribute
browser-compat: html.global_attributes.title
sidebar: htmlsidebar
---

Thuộc tính [toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`title`** chứa văn bản đại diện cho thông tin tư vấn liên quan đến phần tử mà nó thuộc về.

{{InteractiveExample("HTML Demo: title", "tabbed-shorter")}}

```html interactive-example
<p>
  Use the <code>title</code> attribute on an <code>iframe</code> to clearly
  identify the content of the <code>iframe</code> to screen readers.
</p>

<iframe
  title="Wikipedia page for the HTML language"
  src="https://en.m.wikipedia.org/wiki/HTML"></iframe>
<iframe
  title="Wikipedia page for the CSS language"
  src="https://en.m.wikipedia.org/wiki/CSS"></iframe>
```

```css interactive-example
iframe {
  height: 200px;
  margin-bottom: 24px;
  width: 100%;
}
```

Mục đích sử dụng chính của thuộc tính `title` là để gắn nhãn cho các phần tử {{HTMLElement("iframe")}} cho công nghệ hỗ trợ.

Thuộc tính `title` cũng có thể được dùng để gắn nhãn các điều khiển trong [bảng dữ liệu](/en-US/docs/Web/HTML/Reference/Elements/table).

Thuộc tính `title`, khi được thêm vào [`<link rel="stylesheet">`](/en-US/docs/Web/HTML/Reference/Elements/link), tạo ra một bảng kiểu thay thế. Khi định nghĩa bảng kiểu thay thế với `<link rel="alternate">`, thuộc tính là bắt buộc và phải được đặt thành chuỗi không rỗng.

Nếu được đưa vào thẻ mở {{htmlelement('abbr')}}, `title` phải là phần mở rộng đầy đủ của chữ viết tắt hoặc từ viết tắt. Thay vì sử dụng `title`, khi có thể, hãy cung cấp phần mở rộng của chữ viết tắt hoặc từ viết tắt bằng văn bản thuần trong lần sử dụng đầu tiên, sử dụng `<abbr>` để đánh dấu chữ viết tắt. Điều này cho phép tất cả người dùng biết tên hoặc thuật ngữ mà chữ viết tắt rút gọn đồng thời cung cấp gợi ý cho tác nhân người dùng về cách thông báo nội dung.

Mặc dù `title` có thể được dùng để cung cấp nhãn liên kết theo chương trình cho phần tử {{HTMLElement("input")}}, đây không phải là thực hành tốt. Thay vào đó hãy dùng {{HTMLElement("label")}}.

## Tiêu đề nhiều dòng

Thuộc tính `title` có thể chứa nhiều dòng. Mỗi ký tự `U+000A LINE FEED` (`LF`) đại diện cho một ngắt dòng. Cần chú ý một số điều, vì điều này có nghĩa là đoạn sau được hiển thị trên hai dòng:

### HTML

```html
<p>
  Newlines in <code>title</code> should be taken into account. This
  <span
    title="This is a
multiline title">
    example span
  </span>
  has a title attribute with a newline.
</p>
<hr />
<pre id="output"></pre>
```

### JavaScript

Chúng ta có thể truy vấn thuộc tính `title` và hiển thị nó trong phần tử `<pre>` rỗng như sau:

```js
const span = document.querySelector("span");
const output = document.querySelector("#output");
output.textContent = span.title;
```

### Kết quả

{{EmbedLiveSample('Multiline_titles')}}

## Kế thừa thuộc tính title

Nếu một phần tử không có thuộc tính `title`, thì nó kế thừa từ nút cha, nút cha lại có thể kế thừa từ cha của nó, và cứ thế tiếp tục.

Nếu thuộc tính này được đặt thành chuỗi rỗng, điều đó có nghĩa là `title` của các phần tử tổ tiên không liên quan và không nên được dùng trong tooltip cho phần tử này.

### HTML

```html
<div title="CoolTip">
  <p>Hovering here will show "CoolTip".</p>
  <p title="">Hovering here will show nothing.</p>
</div>
```

### Kết quả

{{EmbedLiveSample('Title_attribute_inheritance')}}

## Vấn đề về khả năng tiếp cận

Việc sử dụng thuộc tính `title` rất có vấn đề đối với:

- Người dùng thiết bị chỉ cảm ứng
- Người điều hướng bằng bàn phím
- Người điều hướng bằng công nghệ hỗ trợ như trình đọc màn hình hoặc kính lúp
- Người gặp khó khăn về kiểm soát vận động tinh
- Người có mối lo ngại về nhận thức

Điều này là do hỗ trợ trình duyệt không đồng nhất, cộng thêm phân tích cú pháp công nghệ hỗ trợ bổ sung của trang do trình duyệt hiển thị. Nếu muốn hiệu ứng tooltip, tốt hơn là nên [sử dụng kỹ thuật dễ tiếp cận hơn](https://inclusive-components.design/tooltips-toggletips/) có thể được truy cập bằng các phương thức duyệt web trên.

- [3.2.5.1. The title attribute | W3C HTML 5.2: 3. Semantics, structure, and APIs of HTML documents](https://html.spec.whatwg.org/multipage/dom.html#the-title-attribute)
- [Using the HTML title attribute – updated | Vispero](https://vispero.com/resources/using-the-html-title-attribute-updated/)
- [Tooltips & Toggletips - Inclusive Components](https://inclusive-components.design/tooltips-toggletips/)
- [The Trials and Tribulations of the Title Attribute - 24 Accessibility](https://www.24a11y.com/2017/the-trials-and-tribulations-of-the-title-attribute/)

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).
- {{domxref("HTMLElement.title")}} phản ánh thuộc tính này.
