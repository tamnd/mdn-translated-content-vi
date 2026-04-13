---
title: "Permissions: phương thức revoke()"
short-title: revoke()
slug: Web/API/Permissions/revoke
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.Permissions.revoke
---

{{APIRef("Permissions API")}}{{AvailableInWorkers}}{{deprecated_header}}

Phương thức **`revoke()`** của giao diện {{domxref("Permissions")}} hoàn nguyên một quyền hiện đang được đặt về trạng thái mặc định của nó, thường là `prompt`.
Phương thức này được gọi trên đối tượng toàn cục {{domxref("Permissions")}} {{domxref("navigator.permissions")}}.

Phương thức này bị xóa khỏi thông số kỹ thuật Permissions API chính vì trường hợp sử dụng của nó không rõ ràng.
Các quyền được quản lý bởi trình duyệt và mô hình quyền hiện tại không liên quan đến việc nhà phát triển trang web có thể yêu cầu hoặc thu hồi quyền theo cách chương trình. Các trình duyệt đã cung cấp API này đằng sau các preferences nhưng nó không thể đạt đến các tiêu chuẩn.

## Cú pháp

```js-nolint
revoke(permissionDescriptor)
```

### Tham số

- `permissionDescriptor`
  - : Một đối tượng đặt các tùy chọn cho thao tác `revoke`.
    Các tùy chọn có sẵn cho descriptor này phụ thuộc vào loại quyền.

    Tất cả các quyền đều có tên:
    - `name`
      - : Một chuỗi chứa tên của API mà bạn muốn truy vấn quyền.
        {{jsxref("Promise")}} được trả về sẽ reject với {{jsxref("TypeError")}} nếu tên quyền không được hỗ trợ bởi trình duyệt.

### Giá trị trả về

Một {{jsxref("Promise")}} gọi trình xử lý hoàn thành của nó với một đối tượng {{domxref("PermissionStatus")}} chỉ ra kết quả của yêu cầu.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Việc lấy thông tin `PermissionDescriptor` thất bại theo cách nào đó, hoặc quyền không tồn tại hoặc hiện không được hỗ trợ (ví dụ: `midi`, hoặc `push` với `userVisibleOnly`).

## Ví dụ

Hàm này có thể được sử dụng bởi ứng dụng để yêu cầu thu hồi quyền Geolocation API của chính nó.

```js
function revokePermission() {
  navigator.permissions.revoke({ name: "geolocation" }).then((result) => {
    report(result.state);
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
