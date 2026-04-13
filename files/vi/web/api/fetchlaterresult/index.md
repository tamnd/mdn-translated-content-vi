---
title: FetchLaterResult
slug: Web/API/FetchLaterResult
page-type: web-api-interface
status:
  - experimental
browser-compat: api.FetchLaterResult
---

{{APIRef("Fetch API")}}{{SeeCompatTable}}

Giao diện **`FetchLaterResult`** của [Fetch API](/en-US/docs/Web/API/Fetch_API) được trả về bởi phương thức {{domxref("Window.fetchLater()")}} sau khi một yêu cầu fetch trì hoãn được tạo.

Nó chứa một thuộc tính `activated` duy nhất cho biết liệu yêu cầu trì hoãn đã được gửi hay chưa.

Sau khi gửi thành công, toàn bộ phản hồi bị bỏ qua, bao gồm nội dung và tiêu đề, vì vậy phản hồi của yêu cầu fetch trì hoãn không bao giờ được trả về giao diện `FetchLaterResult`.

## Thuộc tính phiên bản

- {{domxref('FetchLaterResult.activated')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trường giá trị boolean chỉ đọc cho biết liệu yêu cầu trì hoãn đã được gửi hay chưa. Ban đầu được đặt thành `false` và sau đó sẽ được cập nhật bởi trình duyệt khi yêu cầu fetch trì hoãn đã được gửi.

## Ví dụ

### Trì hoãn yêu cầu `POST` khoảng một phút và tạo hàm kiểm tra xem đã gửi chưa

```js
const result = fetchLater("https://report.example.com", {
  method: "POST",
  body: JSON.stringify(myReport),
  activateAfter: 60000 /* 1 phút */,
});

function checkIfFetched() {
  return result.activated;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fetch API](/en-US/docs/Web/API/Fetch_API)
- [Sử dụng Deferred Fetch](/en-US/docs/Web/API/Fetch_API/Using_Deferred_Fetch)
