---
title: "MediaSource: canConstructInDedicatedWorker static property"
short-title: canConstructInDedicatedWorker
slug: Web/API/MediaSource/canConstructInDedicatedWorker_static
page-type: web-api-static-property
browser-compat: api.MediaSource.canConstructInDedicatedWorker_static
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính tĩnh **`canConstructInDedicatedWorker`** của giao diện {{domxref("MediaSource")}} trả về `true` nếu đã triển khai hỗ trợ `MediaSource` trong worker, cung cấp một cơ chế phát hiện tính năng độ trễ thấp.

Nếu không có sẵn tính năng này, cách thay thế sẽ là một phương pháp có độ trễ cao hơn nhiều, chẳng hạn như cố gắng tạo đối tượng `MediaSource` từ một dedicated worker và chuyển kết quả về luồng chính.

## Giá trị

Một boolean. Trả về `true` nếu đã triển khai hỗ trợ `MediaSource` trong worker, hoặc `false` trong trường hợp ngược lại.

## Ví dụ

```js
if (MediaSource.canConstructInDedicatedWorker) {
  // MSE is available in workers; let's do this
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [MSE-in-Workers Demo by Matt Wolenetz](https://wolenetz.github.io/mse-in-workers-demo/mse-in-workers-demo.html)
- {{domxref("Media Source Extensions API", "Media Source Extensions API", "", "nocode")}}
- {{domxref("MediaSource")}}
- {{domxref("SourceBuffer")}}
