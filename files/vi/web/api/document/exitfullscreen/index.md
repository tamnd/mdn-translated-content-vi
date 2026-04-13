---
title: "Document: phương thức exitFullscreen()"
short-title: exitFullscreen()
slug: Web/API/Document/exitFullscreen
page-type: web-api-instance-method
browser-compat: api.Document.exitFullscreen
---

{{ApiRef("Fullscreen API")}}

Phương thức {{domxref("Document")}} **`exitFullscreen()`** yêu cầu phần tử trên tài liệu này đang được trình bày ở chế độ toàn màn hình được đưa ra khỏi chế độ toàn màn hình, khôi phục trạng thái trước đó của màn hình. Điều này thường đảo ngược hiệu ứng của một lệnh gọi trước đó đến {{domxref("Element.requestFullscreen()")}}.

## Cú pháp

```js-nolint
exitFullscreen()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} sẽ được phân giải một khi {{Glossary("user agent")}} hoàn tất việc thoát khỏi chế độ toàn màn hình. Nếu xảy ra lỗi khi cố thoát khỏi chế độ toàn màn hình, trình xử lý `catch()` của promise sẽ được gọi.

## Ví dụ

Ví dụ này khiến tài liệu hiện tại chuyển đổi vào và ra khỏi chế độ trình bày toàn màn hình bất cứ khi nào nhấp chuột trong đó.

```js
document.onclick = (event) => {
  if (document.fullscreenElement) {
    document
      .exitFullscreen()
      .then(() => console.log("Tài liệu đã thoát khỏi chế độ toàn màn hình"))
      .catch((err) => console.error(err));
  } else {
    document.documentElement.requestFullscreen();
  }
};
```

> [!NOTE]
> Để biết ví dụ đầy đủ hơn, xem [các ví dụ về `Element.requestFullscreen()`](/en-US/docs/Web/API/Element/requestFullscreen#examples).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API)
- [Hướng dẫn sử dụng Fullscreen API](/en-US/docs/Web/API/Fullscreen_API/Guide)
- {{ domxref("Element.requestFullscreen()") }}
- {{ domxref("Document.fullscreenElement") }}
- {{ cssxref(":fullscreen") }} và {{cssxref("::backdrop")}}
- Thuộc tính [`allowfullscreen`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allowfullscreen) của {{HTMLElement("iframe")}}
