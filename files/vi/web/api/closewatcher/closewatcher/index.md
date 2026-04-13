---
title: "CloseWatcher: bộ khởi tạo CloseWatcher()"
short-title: CloseWatcher()
slug: Web/API/CloseWatcher/CloseWatcher
page-type: web-api-constructor
browser-compat: api.CloseWatcher.CloseWatcher
---

{{APIRef("HTML DOM")}}

Bộ khởi tạo **`CloseWatcher()`** tạo một đối tượng {{domxref("CloseWatcher")}} mới.

Bạn có thể tạo các thể hiện `CloseWatcher` mà không cần [kích hoạt người dùng](/en-US/docs/Web/Security/Defenses/User_activation), và điều này hữu ích để triển khai các trường hợp như hộp thoại hết thời gian chờ do không hoạt động trong phiên. Tuy nhiên, nếu bạn tạo nhiều hơn một `CloseWatcher` mà không có kích hoạt người dùng, thì thể hiện mới tạo sẽ được nhóm với thể hiện cuối cùng, nên một yêu cầu đóng duy nhất sẽ đóng cả hai. Điều này có nghĩa là bạn cần gọi {{domxref("CloseWatcher.destroy()", "destroy()")}}, {{domxref("CloseWatcher.close()", "close()")}} và {{domxref("CloseWatcher.requestClose()", "requestClose()")}} một cách đúng đắn.

## Cú pháp

```js-nolint
new CloseWatcher()
new CloseWatcher(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng có các thuộc tính sau:
    - `signal`
      - : Một {{domxref("AbortSignal")}}. Nếu được cung cấp, watcher có thể bị hủy (giống như khi gọi {{domxref("CloseWatcher.destroy()")}}) bằng cách gọi {{domxref("AbortController.abort()")}} trên {{domxref("AbortController")}} tương ứng.

### Giá trị trả về

Một đối tượng {{domxref("CloseWatcher")}} mới.

## Ví dụ

### Tạo các thể hiện `CloseWatcher` mới

Tạo một `CloseWatcher` mới.

```js
const watcher = new CloseWatcher();
```

Tạo một `CloseWatcher` mới với một {{domxref("AbortSignal")}} điều khiển việc hủy watcher.

```js
const controller = new AbortController();
const signalWatcher = new CloseWatcher({ signal: controller.signal });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
