---
title: "NavigationPreloadManager: phương thức getState()"
short-title: getState()
slug: Web/API/NavigationPreloadManager/getState
page-type: web-api-instance-method
browser-compat: api.NavigationPreloadManager.getState
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`getState()`** của giao diện {{domxref("NavigationPreloadManager")}} trả về một {{jsxref("Promise")}} phân giải thành đối tượng với các thuộc tính cho biết liệu tải trước có được bật hay không và giá trị nào sẽ được gửi trong header HTTP {{HTTPHeader("Service-Worker-Navigation-Preload")}}.

## Cú pháp

```js-nolint
getState()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải với đối tượng có các thuộc tính sau:

- `enabled`
  - : `true` nếu tải trước được bật, và `false` nếu không.
- `headerValue`
  - : Một chuỗi chứa giá trị sẽ được gửi trong header HTTP `Service-Worker-Navigation-Preload` sau khi tải trước {{domxref("Window/fetch", "fetch()")}}. Giá trị mặc định là `true` trừ khi giá trị được thay đổi bằng {{domxref("NavigationPreloadManager.setHeaderValue()")}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Không có worker hoạt động nào liên kết với registration mà {{domxref("NavigationPreloadManager")}} này thuộc về.

## Ví dụ

Đoạn code dưới đây cho thấy yêu cầu trạng thái hiện tại, được thực hiện sau khi service worker đã sẵn sàng.

```js
navigator.serviceWorker.ready
  .then((registration) => registration.navigationPreload.getState())
  .then((state) => {
    console.log(state.enabled); // boolean
    console.log(state.headerValue); // string
  })
  .catch((e) =>
    console.error(`NavigationPreloadManager not supported: ${e.message}`),
  );
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
