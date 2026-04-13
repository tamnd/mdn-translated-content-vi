---
title: "Permissions: phương thức query()"
short-title: query()
slug: Web/API/Permissions/query
page-type: web-api-instance-method
browser-compat: api.Permissions.query
---

{{APIRef("Permissions API")}}{{AvailableInWorkers}}

Phương thức **`query()`** của giao diện {{domxref("Permissions")}} trả về trạng thái quyền của người dùng trên phạm vi toàn cục.

## Cú pháp

```js-nolint
query(permissionDescriptor)
```

### Tham số

- `permissionDescriptor`
  - : Một đối tượng đặt các tùy chọn cho thao tác `query`.
    Các tùy chọn có sẵn cho descriptor này phụ thuộc vào loại quyền.

    Tất cả các quyền đều có tên:
    - `name`
      - : Một chuỗi chứa tên của API mà bạn muốn truy vấn quyền, chẳng hạn như `camera`, `bluetooth`, `microphone`, `geolocation` (xem [`Permissions`](/en-US/docs/Web/API/Permissions#browser_compatibility) để biết danh sách đầy đủ hơn).
        {{jsxref("Promise")}} được trả về sẽ reject với {{jsxref("TypeError")}} nếu tên quyền không được hỗ trợ bởi trình duyệt.

    Đối với quyền `push`, bạn cũng có thể chỉ định:
    - `userVisibleOnly` {{optional_inline}}
      - : (Chỉ Push, không được hỗ trợ trong Firefox) Chỉ ra liệu bạn có muốn hiển thị thông báo cho mọi thông báo hay có thể gửi các push thông báo im lặng hay không.
        Mặc định là `false`.

    Đối với quyền `midi`, bạn cũng có thể chỉ định:
    - `sysex` {{optional_inline}}
      - : Chỉ ra liệu bạn có cần và/hoặc nhận tin nhắn hệ thống độc quyền hay không.
        Mặc định là `false`.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết thành một đối tượng {{domxref("PermissionStatus")}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu phương thức `query()` được gọi trong ngữ cảnh duyệt web và tài liệu liên kết của nó không hoàn toàn hoạt động.
- {{jsxref("TypeError")}}
  - : Được ném nếu việc lấy thông tin `PermissionDescriptor` thất bại theo cách nào đó, hoặc quyền không tồn tại hoặc không được hỗ trợ bởi user agent.

## Ví dụ

### Hiển thị tin tức dựa trên quyền vị trí địa lý

Ví dụ này cho thấy cách bạn có thể hiển thị tin tức liên quan đến vị trí hiện tại nếu quyền `geolocation` được cấp, và ngược lại nhắc người dùng bật quyền truy cập vào vị trí.

```js
navigator.permissions.query({ name: "geolocation" }).then((result) => {
  if (result.state === "granted") {
    showLocalNewsWithGeolocation();
  } else if (result.state === "prompt") {
    showButtonToEnableLocalNews();
  }
  // Không làm gì nếu quyền bị từ chối.
});
```

### Kiểm tra hỗ trợ cho các quyền khác nhau

Ví dụ này hiển thị kết quả của việc truy vấn mỗi quyền.

```js
// Mảng các quyền
const permissions = [
  "accelerometer",
  "accessibility-events",
  "ambient-light-sensor",
  "background-sync",
  "camera",
  "clipboard-read",
  "clipboard-write",
  "geolocation",
  "gyroscope",
  "local-fonts",
  "magnetometer",
  "microphone",
  "midi",
  "notifications",
  "payment-handler",
  "persistent-storage",
  "push",
  "screen-wake-lock",
  "storage-access",
  "top-level-storage-access",
  "window-management",
];

processPermissions();

// Lặp qua các quyền và ghi nhật ký kết quả
async function processPermissions() {
  for (const permission of permissions) {
    const result = await getPermission(permission);
    log(result);
  }
}

// Truy vấn một quyền duy nhất trong khối try...catch và trả về kết quả
async function getPermission(permission) {
  try {
    let result;
    if (permission === "top-level-storage-access") {
      result = await navigator.permissions.query({
        name: permission,
        requestedOrigin: window.location.origin,
      });
    } else {
      result = await navigator.permissions.query({ name: permission });
    }
    return `${permission}: ${result.state}`;
  } catch (error) {
    return `${permission} (not supported)`;
  }
}
```

{{EmbedLiveSample('Test support for various permissions',"100%", "370px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
