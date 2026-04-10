---
title: "MutationObserver: phương thức disconnect()"
short-title: disconnect()
slug: Web/API/MutationObserver/disconnect
page-type: web-api-instance-method
browser-compat: api.MutationObserver.disconnect
---

{{APIRef("DOM WHATWG")}}

Phương thức {{domxref("MutationObserver")}} **`disconnect()`** yêu cầu observer ngừng theo dõi các biến đổi.

Observer có thể được dùng lại bằng cách gọi lại phương thức {{domxref("MutationObserver.observe", "observe()")}} của nó.

## Cú pháp

```js-nolint
disconnect()
```

### Tham số

Không có.

### Giá trị trả về

`undefined`.

> [!NOTE]
> Tất cả thông báo về các biến đổi đã được _phát hiện_ nhưng _chưa được báo cáo_ cho observer sẽ bị loại bỏ. Để giữ lại và xử lý các biến đổi đã phát hiện nhưng chưa được báo cáo, hãy dùng phương thức {{domxref("MutationObserver.takeRecords()", "takeRecords()")}}.

## Ghi chú sử dụng

Nếu phần tử đang được theo dõi bị xóa khỏi DOM, rồi sau đó được giải phóng bởi cơ chế thu gom rác của trình duyệt, `MutationObserver` sẽ ngừng quan sát phần tử bị xóa đó. Tuy nhiên, bản thân `MutationObserver` vẫn có thể tiếp tục tồn tại để quan sát các phần tử hiện có khác.

## Ví dụ

Ví dụ này tạo một observer, sau đó ngắt kết nối nó, để nó vẫn sẵn sàng cho việc tái sử dụng trong tương lai.

```js
const targetNode = document.querySelector("#someElement");
const observerOptions = {
  childList: true,
  attributes: true,
};

const observer = new MutationObserver(callback);
observer.observe(targetNode, observerOptions);

/* một lúc sau… */

observer.disconnect();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
