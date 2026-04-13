---
title: "Response: phương thức formData()"
short-title: formData()
slug: Web/API/Response/formData
page-type: web-api-instance-method
browser-compat: api.Response.formData
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Phương thức **`formData()`** của giao diện {{domxref("Response")}} nhận một luồng {{domxref("Response")}} và đọc nó đến hết. Phương thức này trả về một promise giải quyết với một đối tượng {{domxref("FormData")}}.

> [!NOTE]
> Điều này chủ yếu liên quan tới [service worker](/en-US/docs/Web/API/Service_Worker_API). Nếu người dùng gửi một biểu mẫu và service worker chặn yêu cầu, bạn có thể gọi `formData()` trên yêu cầu đó để lấy một map khóa-giá trị, sửa đổi một vài trường, rồi gửi biểu mẫu tiếp tới máy chủ, hoặc xử lý cục bộ.

## Cú pháp

```js-nolint
formData()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết với một đối tượng {{domxref("FormData")}}.

### Ngoại lệ

- `AbortError` {{domxref("DOMException")}}
  - : Yêu cầu đã bị [hủy](/en-US/docs/Web/API/Fetch_API/Using_Fetch#canceling_a_request).
- {{jsxref("TypeError")}}
  - : Ném ra vì một trong các lý do sau:
    - Body phản hồi bị [disturbed hoặc locked](/en-US/docs/Web/API/Fetch_API/Using_Fetch#locked_and_disturbed_streams).
    - Có lỗi giải mã nội dung body, ví dụ do header {{httpheader("Content-Encoding")}} không đúng.
    - Kiểu {{glossary("MIME")}} của body không xác định được từ các header {{httpheader("Content-Type")}} có trong phản hồi, hoặc không phải `application/x-www-form-urlencoded` hay `multipart/form-data`.
    - Body không thể được phân tích thành đối tượng `FormData`.

## Ví dụ

TBD.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
