---
title: "XRSystem: phương thức isSessionSupported()"
short-title: isSessionSupported()
slug: Web/API/XRSystem/isSessionSupported
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRSystem.isSessionSupported
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`isSessionSupported()`** của {{domxref("XRSystem")}} trả về một promise phân giải thành `true` nếu chế độ phiên WebXR được chỉ định được hỗ trợ bởi thiết bị WebXR của người dùng. Ngược lại, promise phân giải thành `false`.

Nếu không có thiết bị nào hoặc trình duyệt không có quyền sử dụng thiết bị XR, promise bị từ chối với {{domxref("DOMException")}} phù hợp.

## Cú pháp

```js-nolint
isSessionSupported(mode)
```

### Tham số

- `mode`
  - : Một {{jsxref("String")}} chỉ định chế độ phiên WebXR cần kiểm tra hỗ trợ. Các chế độ có thể kiểm tra:
    - `immersive-ar` {{Experimental_Inline}}
    - `immersive-vr`
    - `inline`

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành `true` nếu chế độ phiên được chỉ định được hỗ trợ; ngược lại promise phân giải thành `false`.

### Ngoại lệ

Thay vì ném ngoại lệ thực sự, `isSessionSupported()` từ chối promise được trả về, truyền cho trình xử lý từ chối một {{domxref("DOMException")}} có `name` là một trong các chuỗi sau.

- `SecurityError`
  - : Việc sử dụng tính năng này bị chặn bởi chính sách quyền `xr-spatial-tracking` [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

## Ví dụ

Trong ví dụ này, chúng ta thấy `isSessionSupported()` được sử dụng để phát hiện liệu thiết bị có hỗ trợ chế độ VR hay không bằng cách kiểm tra xem phiên `immersive-vr` có được hỗ trợ không. Nếu có, chúng ta thiết lập một nút để đọc "Enter XR", gọi phương thức `onButtonClicked()` và bật nút.

Nếu chưa có phiên nào đang diễn ra, chúng ta yêu cầu phiên VR và nếu thành công, thiết lập phiên trong phương thức `onSessionStarted()`. Nếu phiên đã đang diễn ra khi nút được nhấp, chúng ta gọi phương thức `end()` của đối tượng `xrSession` để tắt phiên WebXR.

```js
if (navigator.xr) {
  navigator.xr.isSessionSupported("immersive-vr").then((isSupported) => {
    if (isSupported) {
      userButton.addEventListener("click", onButtonClicked);
      userButton.textContent = "Enter XR";
      userButton.disabled = false;
    }
  });
}

function onButtonClicked() {
  if (!xrSession) {
    navigator.xr.requestSession("immersive-vr").then((session) => {
      xrSession = session;
      // onSessionStarted() không được hiển thị vì lý do ngắn gọn và rõ ràng.
      onSessionStarted(xrSession);
    });
  } else {
    // Nút là nút bật/tắt.
    xrSession.end();
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
