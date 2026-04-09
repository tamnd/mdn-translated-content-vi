---
title: "BroadcastChannel: phương thức postMessage()"
short-title: postMessage()
slug: Web/API/BroadcastChannel/postMessage
page-type: web-api-instance-method
browser-compat: api.BroadcastChannel.postMessage
---

{{APIRef("BroadCastChannel API")}} {{AvailableInWorkers}}

Phương thức **`postMessage()`** của giao diện {{domxref("BroadcastChannel")}} gửi một thông điệp, có thể là bất kỳ loại {{jsxref("Object")}} nào, tới từng trình lắng nghe trong mọi {{glossary("browsing context")}} có cùng {{glossary("origin")}}.
Thông điệp được truyền đi dưới dạng sự kiện {{domxref("BroadcastChannel/message_event", "message")}} nhắm tới từng {{domxref("BroadcastChannel")}} được gắn với kênh.

## Cú pháp

```js-nolint
postMessage(message)
```

### Tham số

- `message`
  - : Dữ liệu sẽ được gửi tới cửa sổ khác. Dữ liệu được tuần tự hóa bằng [thuật toán structured clone](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm).
    Điều này có nghĩa là bạn có thể truyền một phạm vi rất rộng các đối tượng dữ liệu tới cửa sổ đích một cách an toàn mà không cần tự tuần tự hóa chúng.

    > [!NOTE]
    > Các ngữ cảnh thực thi có thể nhắn tin cho nhau có thể không nằm trong cùng một [cụm agent](/en-US/docs/Web/JavaScript/Reference/Execution_model#agent_clusters_and_memory_sharing), và vì vậy không thể chia sẻ bộ nhớ. Các đối tượng {{jsxref("SharedArrayBuffer")}}, hoặc các khung nhìn bộ đệm được hậu thuẫn bởi một đối tượng như vậy, không thể được gửi qua các cụm agent. Nếu cố làm điều đó, đầu nhận sẽ phát sinh một sự kiện {{domxref("BroadcastChannel/messageerror_event", "messageerror")}} chứa {{domxref("DOMException")}} `DataCloneError`.

### Giá trị trả về

Không có.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Phát sinh nếu {{domxref("BroadcastChannel")}} đã bị đóng trước đó.
- `DataCloneError` {{domxref("DOMException")}}
  - : Phát sinh nếu có bất kỳ phần nào của dữ liệu đầu vào không thể tuần tự hóa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("BroadcastChannel")}}, giao diện mà phương thức này thuộc về.
