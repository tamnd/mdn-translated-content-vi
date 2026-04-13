---
title: "Blob: phương thức slice()"
short-title: slice()
slug: Web/API/Blob/slice
page-type: web-api-instance-method
browser-compat: api.Blob.slice
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Phương thức **`slice()`** của giao diện {{domxref("Blob")}} tạo và trả về một đối tượng `Blob` mới, chứa dữ liệu từ một phần của blob mà phương thức được gọi trên đó.

## Cú pháp

```js-nolint
slice()
slice(start)
slice(start, end)
slice(start, end, contentType)
```

### Tham số

- `start` {{optional_inline}}
  - : Một chỉ mục trong {{domxref("Blob")}} chỉ byte đầu tiên cần đưa vào {{domxref("Blob")}} mới. Nếu chỉ định giá trị âm, giá trị đó được xem là độ lệch từ cuối {{domxref("Blob")}} về đầu. Ví dụ, -10 sẽ là byte thứ 10 tính từ cuối lên trong {{domxref("Blob")}}. Giá trị mặc định là 0. Nếu bạn chỉ định `start` lớn hơn kích thước của {{domxref("Blob")}} nguồn, {{domxref("Blob")}} được trả về sẽ có kích thước 0 và không chứa dữ liệu.
- `end` {{optional_inline}}
  - : Một chỉ mục trong {{domxref("Blob")}} chỉ byte đầu tiên sẽ _không_ được đưa vào {{domxref("Blob")}} mới (nghĩa là byte đúng tại chỉ mục này sẽ không được đưa vào). Nếu chỉ định giá trị âm, giá trị đó được xem là độ lệch từ cuối {{domxref("Blob")}} về đầu. Ví dụ, -10 sẽ là byte thứ 10 tính từ cuối lên trong {{domxref("Blob")}}. Giá trị mặc định là `size`.
- `contentType` {{optional_inline}}
  - : Kiểu nội dung gán cho {{domxref("Blob")}} mới; đây sẽ là giá trị của thuộc tính `type` của nó. Giá trị mặc định là chuỗi rỗng.

### Giá trị trả về

Một đối tượng {{domxref("Blob")}} mới chứa phần con dữ liệu được chỉ định trong blob mà phương thức này được gọi trên đó. Blob gốc không bị thay đổi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Blob")}}
- [Sử dụng tệp từ ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications)
