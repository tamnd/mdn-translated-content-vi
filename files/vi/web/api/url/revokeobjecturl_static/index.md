---
title: "URL: phương thức tĩnh revokeObjectURL()"
short-title: revokeObjectURL()
slug: Web/API/URL/revokeObjectURL_static
page-type: web-api-static-method
browser-compat: api.URL.revokeObjectURL_static
---

{{APIRef("File API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Phương thức tĩnh **`revokeObjectURL()`** của giao diện {{domxref("URL")}} giải phóng một object URL hiện có vốn đã được tạo trước đó bằng cách gọi {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}}.

Để biết thêm thông tin, xem [blob URLs](/en-US/docs/Web/URI/Reference/Schemes/blob).

Hãy gọi phương thức này khi bạn đã dùng xong object URL để cho trình duyệt biết không cần giữ tham chiếu đến file nữa.

Nếu đối số `objectURL` được truyền vào không phải là một object URL đang hoạt động - ví dụ nếu đó là một URL không hợp lệ, không phải object URL, hoặc đã bị thu hồi - thì việc gọi phương thức này sẽ không làm gì cả.

> [!NOTE]
> Phương thức này _không_ khả dụng trong [Service Workers](/en-US/docs/Web/API/Service_Worker_API), do các vấn đề liên quan đến vòng đời của giao diện {{domxref("Blob")}} và khả năng rò rỉ.

## Cú pháp

```js-nolint
URL.revokeObjectURL(objectURL)
```

### Tham số

- `objectURL`
  - : Một chuỗi đại diện cho một object URL đã được tạo trước đó bằng cách gọi {{domxref("URL.createObjectURL_static", "createObjectURL()")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Xem [Cách dùng object URL để hiển thị hình ảnh](/en-US/docs/Web/API/File_API/Using_files_from_web_applications#example_using_object_urls_to_display_images).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Blob URLs](/en-US/docs/Web/URI/Reference/Schemes/blob)
- [Cách dùng các file từ ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications)
- [Cách dùng object URL để hiển thị hình ảnh](/en-US/docs/Web/API/File_API/Using_files_from_web_applications#example_using_object_urls_to_display_images)
- {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}}
