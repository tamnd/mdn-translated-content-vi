---
title: "XMLHttpRequest: thuộc tính statusText"
short-title: statusText
slug: Web/API/XMLHttpRequest/statusText
page-type: web-api-instance-property
browser-compat: api.XMLHttpRequest.statusText
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Thuộc tính chỉ đọc **`XMLHttpRequest.statusText`** trả về một chuỗi chứa thông báo trạng thái của phản hồi do máy chủ HTTP trả về. Không giống như [`XMLHttpRequest.status`](/en-US/docs/Web/API/XMLHttpRequest/status) cho biết một mã trạng thái số, thuộc tính này chứa _văn bản_ của trạng thái phản hồi, chẳng hạn như "OK" hoặc "Not Found". Nếu [`readyState`](/en-US/docs/Web/API/XMLHttpRequest/readyState) của yêu cầu ở trạng thái `UNSENT` hoặc `OPENED`, giá trị của `statusText` sẽ là một chuỗi rỗng.

Nếu phản hồi của máy chủ không chỉ định rõ ràng văn bản trạng thái, `statusText` sẽ giả định giá trị mặc định là "OK".

> [!NOTE]
> Các phản hồi qua kết nối HTTP/2 sẽ luôn có chuỗi rỗng làm thông báo trạng thái vì HTTP/2 không hỗ trợ chúng.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const xhr = new XMLHttpRequest();
console.log("0 UNSENT", xhr.statusText);

xhr.open("GET", "/server", true);
console.log("1 OPENED", xhr.statusText);

xhr.onprogress = () => {
  console.log("3 LOADING", xhr.statusText);
};

xhr.onload = () => {
  console.log("4 DONE", xhr.statusText);
};

xhr.send(null);

/**
 * Xuất ra như sau:
 *
 * 0 UNSENT
 * 1 OPENED
 * 3 LOADING OK
 * 4 DONE OK
 */
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Danh sách [mã trạng thái HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [HTTP](/en-US/docs/Web/HTTP)
- [WHATWG Fetch Living Standard](https://fetch.spec.whatwg.org/#concept-response-status-message)
