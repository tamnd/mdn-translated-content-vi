---
title: "Document: visibilityState property"
short-title: visibilityState
slug: Web/API/Document/visibilityState
page-type: web-api-instance-property
browser-compat: api.Document.visibilityState
---

{{ApiRef("DOM")}}

Thuộc tính chỉ đọc **`Document.visibilityState`** trả về trạng thái hiển thị của tài liệu. Nó có thể được sử dụng để kiểm tra xem tài liệu có ở chế độ nền hoặc trong cửa sổ thu nhỏ hay không, hoặc bằng cách nào đó không hiển thị cho người dùng.

Khi giá trị của thuộc tính này thay đổi, sự kiện {{domxref("Document/visibilitychange_event", "visibilitychange")}} được gửi đến {{domxref("Document")}}.

Thuộc tính {{domxref("Document.hidden")}} cung cấp một cách thay thế để xác định xem trang có bị ẩn không.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `visible`
  - : Nội dung trang có thể hiển thị ít nhất một phần. Trong thực tế, điều này có nghĩa là trang là tab tiền cảnh của một cửa sổ không thu nhỏ.
- `hidden`
  - : Nội dung trang không hiển thị cho người dùng. Trong thực tế, điều này có nghĩa là tài liệu là một tab nền hoặc một phần của cửa sổ thu nhỏ, hoặc màn hình khóa hệ điều hành đang hoạt động.

## Ví dụ

```js
document.addEventListener("visibilitychange", () => {
  console.log(document.visibilityState);
  // Sửa đổi hành vi…
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.hidden")}}
- [Page Visibility API](/en-US/docs/Web/API/Page_Visibility_API)
