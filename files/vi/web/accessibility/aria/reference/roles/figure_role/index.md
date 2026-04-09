---
title: "ARIA: vai trò figure"
short-title: figure
slug: Web/Accessibility/ARIA/Reference/Roles/figure_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#figure
sidebar: accessibilitysidebar
---

Vai trò ARIA `figure` có thể được dùng để xác định một hình minh họa bên trong nội dung trang khi chưa có ngữ nghĩa phù hợp sẵn. Một figure thường được coi là một hoặc nhiều hình ảnh, đoạn mã, hoặc nội dung khác truyền tải thông tin theo cách khác với luồng văn bản thông thường.

## Mô tả

Một `figure` là một phần nội dung có thể nhận biết, thường chứa tài liệu đồ họa, hình ảnh, đoạn mã hoặc văn bản ví dụ. Các phần của figure CÓ THỂ do người dùng điều hướng. Mọi nội dung nên được nhóm lại và tiêu thụ như một figure, có thể bao gồm hình ảnh, video, âm thanh, đoạn mã hoặc nội dung khác, đều có thể được xác định là figure bằng `role="figure"`.

```html
<div role="figure" aria-labelledby="caption">
  <img src="image.png" alt="đặt mô tả hình ảnh ở đây" />
  <p id="caption">Hình 1: Chú thích</p>
</div>
```

Trong ví dụ trên, chúng ta có một figure gồm hai mục nội dung riêng biệt - một hình ảnh và một chú thích. Chúng được bọc bởi phần tử {{htmlelement("div")}} xác định nội dung là figure bằng `role="figure"`.

Với HTML, hãy dùng các phần tử {{HTMLElement('figure')}} và {{HTMLElement('figcaption')}}. figcaption sẽ đóng vai trò tên truy cập cho figure. Khi không dùng HTML, hoặc khi chỉnh lại HTML cũ, hãy dùng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) trên figure, trỏ tới chú thích của figure.
Nếu không có chú thích hiển thị, có thể dùng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label).

```html
<div role="figure" aria-labelledby="figure-1">
  …
  <p id="figure-1">Văn bản mô tả figure.</p>
</div>
```

- Dùng `aria-labelledby` khi văn bản là một nhãn ngắn gọn.
- Dùng [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) khi văn bản là một mô tả dài hơn.
- Dùng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) khi không có chú thích figure hiển thị.

Có thể làm điều này một cách ngữ nghĩa, không cần ARIA, bằng phần tử {{HTMLElement('figure')}} của HTML cùng với {{HTMLElement('figcaption')}}.

```html
<figure>
  <img src="image.png" alt="đặt mô tả hình ảnh ở đây" />
  <figcaption>Hình 1: Chú thích</figcaption>
</figure>
```

> [!NOTE]
> Nếu có thể trong công việc của bạn, hãy dùng các phần tử HTML ngữ nghĩa phù hợp để đánh dấu một figure và chú thích của nó - {{htmlelement("figure")}} và {{htmlelement("figcaption")}}.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby)
  - : ID của một phần tử chứa văn bản tham chiếu đóng vai trò chú thích.
- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
  - : ID của một phần tử chứa văn bản đóng vai trò nhãn.
- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
  - : Nếu không có phần tử nào chứa văn bản có thể làm nhãn, bạn có thể thêm nhãn trực tiếp làm giá trị của `aria-label` trên phần tử có vai trò `figure` hoặc trên phần tử `<figure>`.

### Tương tác bàn phím

Không có tương tác bàn phím riêng cho vai trò này.

### Các tính năng JavaScript bắt buộc

Không có yêu cầu JavaScript riêng cho vai trò này. Nếu bạn không kiểm soát được ngữ nghĩa HTML, bạn có thể cải thiện khả năng truy cập của HTML bằng cách thêm các vai trò và thuộc tính này bằng JavaScript.

## Ví dụ

Chúng ta có thể mở rộng ví dụ ban đầu trên trang để xác định thêm một đoạn văn cung cấp nhãn mô tả cho figure bằng cách tham chiếu ID của nó trong `aria-labelledby`:

```html
<div role="figure" aria-labelledby="figure-1">
  <img
    src="diagram.png"
    alt="sơ đồ cho thấy bốn lớp tuyệt vời và thứ tự ưu tiên tương đối của chúng —
        âm nhạc, mèo, thiên nhiên và kem" />
  <pre>
`
        let awesome = ['music', 'cats', 'nature', 'ice cream'];
      `</pre
  >
  <p id="figure-1">Hình 1: Bốn lớp tuyệt vời.</p>
</div>
```

## Thực hành tốt nhất

Chỉ dùng `role="figure"` nếu bạn buộc phải làm vậy - ví dụ nếu bạn không kiểm soát được HTML nhưng có thể cải thiện trợ năng động bằng JavaScript sau đó.

Nếu có thể, hãy dùng các phần tử HTML ngữ nghĩa phù hợp để đánh dấu một figure và chú thích của nó - {{htmlelement("figure")}} và {{htmlelement("figcaption")}}. Ví dụ của chúng ta ở trên nên được viết lại như sau:

```html
<figure>
  <img
    src="diagram.png"
    alt="sơ đồ cho thấy bốn lớp tuyệt vời và thứ tự ưu tiên tương đối của chúng —
         âm nhạc, mèo, thiên nhiên và kem" />
  <pre>
`
    let awesome = ['music', 'cats', 'nature', 'ice cream'];
  `</pre
  >
  <figcaption>Hình 1: Bốn lớp tuyệt vời.</figcaption>
</figure>
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [Accessibility Object Model](https://wicg.github.io/aom/spec/)
- [ARIA in HTML](https://w3c.github.io/html-aria/)
- [Phần tử HTML `<figure>`](/en-US/docs/Web/HTML/Reference/Elements/figure)
- [Phần tử HTML `<figcaption>`](/en-US/docs/Web/HTML/Reference/Elements/figcaption)
