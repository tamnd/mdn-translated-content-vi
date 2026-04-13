---
title: "FetchLaterResult: activated property"
short-title: activated
slug: Web/API/FetchLaterResult/activated
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.FetchLaterResult.activated
---

{{APIRef("fetchLater API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`activated`** của giao diện {{domxref("FetchLaterResult")}} trả về giá trị boolean cho biết liệu yêu cầu fetch trì hoãn đã được gửi hay chưa.

## Giá trị

Một {{jsxref('Boolean')}}.

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
