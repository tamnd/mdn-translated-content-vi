---
title: "URL: phương thức tĩnh createObjectURL()"
short-title: createObjectURL()
slug: Web/API/URL/createObjectURL_static
page-type: web-api-static-method
browser-compat: api.URL.createObjectURL_static
---

{{APIRef("File API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Phương thức tĩnh **`createObjectURL()`** của giao diện {{domxref("URL")}} tạo ra một chuỗi chứa một [blob URL](/en-US/docs/Web/URI/Reference/Schemes/blob) trỏ tới đối tượng được cung cấp trong tham số.

Để biết thêm thông tin, xem [blob URLs](/en-US/docs/Web/URI/Reference/Schemes/blob).

Để giải phóng một object URL, hãy gọi {{domxref("URL.revokeObjectURL_static", "revokeObjectURL()")}}.

> [!NOTE]
> Tính năng này _không_ khả dụng trong [Service Workers](/en-US/docs/Web/API/Service_Worker_API) do có khả năng tạo rò rỉ bộ nhớ.

## Cú pháp

```js-nolint
URL.createObjectURL(object)
```

### Tham số

- `object`
  - : Một đối tượng {{domxref("Blob")}} (chẳng hạn như {{domxref("File")}}) hoặc {{domxref("MediaSource")}} để tạo object URL.

### Giá trị trả về

Một chuỗi chứa object URL có thể dùng để tham chiếu nội dung của đối tượng `object` nguồn đã chỉ định.

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
- {{domxref("URL.revokeObjectURL_static", "URL.revokeObjectURL()")}}
- {{domxref("HTMLMediaElement.srcObject")}}
- {{domxref("FileReader.readAsDataURL()")}}
