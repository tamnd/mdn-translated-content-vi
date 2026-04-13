---
title: "HTMLElement: thuộc tính outerText"
short-title: outerText
slug: Web/API/HTMLElement/outerText
page-type: web-api-instance-property
browser-compat: api.HTMLElement.outerText
---

{{APIRef("DOM")}}

Thuộc tính **`outerText`** của giao diện {{domxref("HTMLElement")}} trả về cùng giá trị như {{domxref("HTMLElement.innerText")}}.
Khi dùng làm setter, nó thay thế toàn bộ nút hiện tại bằng văn bản đã cho (điều này khác với `innerText`, thay thế nội dung _bên trong_ nút hiện tại).

Xem {{domxref("HTMLElement.innerText")}} để biết thêm thông tin và các ví dụ mô tả cách cả hai thuộc tính được dùng làm getter.

## Giá trị

Một chuỗi đại diện cho nội dung văn bản được hiển thị của phần tử và các con của nó.

Nếu bản thân phần tử không [đang được hiển thị](https://html.spec.whatwg.org/multipage/rendering.html#being-rendered) (ví dụ: đã bị tách khỏi tài liệu hoặc bị ẩn khỏi tầm nhìn), giá trị trả về giống như thuộc tính {{domxref("Node.textContent")}}.

Khi dùng làm setter, nó thay thế nút hiện tại bằng văn bản đã cho, chuyển đổi bất kỳ xuống dòng nào thành các phần tử {{HTMLElement("br")}}.

## Ví dụ

Ví dụ này làm nổi bật sự khác biệt cơ bản giữa `outerText` và `innerText` khi dùng làm setter (chúng giống nhau khi dùng làm getter).

> [!NOTE]
> Ví dụ là phiên bản sửa đổi của [What is the difference between innerText and outerText?](https://stackoverflow.com/questions/18481382/what-is-the-difference-between-innertext-and-outertext/18481435#18481435) (Stack overflow) bởi [codingintrigue](https://stackoverflow.com/users/571194/codingintrigue), được cấp phép theo [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/).

Xét một trang có HTML sau:

```html
<div>
  <p>Original content</p>
</div>
```

`outerText` thay thế toàn bộ phần tử được chọn, vì vậy đoạn JavaScript `p.outerText = "Whole element replaced"` thay thế toàn bộ phần tử `p` được chọn:

```html
<div>Whole element replaced</div>
```

Ngược lại, `p.innerText = "Content inside element replaced"` thay thế nội dung _bên trong_ phần tử `p` được chọn:

```html
<div>
  <p>Content inside element replaced</p>
</div>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLElement.innerText")}}
- {{domxref("Element.outerHTML")}}
