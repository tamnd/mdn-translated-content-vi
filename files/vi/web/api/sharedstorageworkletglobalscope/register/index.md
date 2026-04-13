---
title: "SharedStorageWorkletGlobalScope: phương thức register()"
short-title: register()
slug: Web/API/SharedStorageWorkletGlobalScope/register
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.SharedStorageWorkletGlobalScope.register
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Phương thức **`register()`** của giao diện {{domxref("SharedStorageWorkletGlobalScope")}} đăng ký một {{domxref("SharedStorageOperation", "thao tác", "", "nocode")}} được định nghĩa bên trong module worklet hiện tại.

## Cú pháp

```js-nolint
register(name, operationCtor)
```

### Tham số

- `name`
  - : Một chuỗi đại diện cho tên mà bạn muốn đăng ký thao tác. Khi thao tác được gọi (ví dụ qua {{domxref("WindowSharedStorage.run()")}} hoặc {{domxref("WindowSharedStorage.selectURL()")}}), tên này được dùng để xác định thao tác bạn muốn chạy.
- `operationCtor`
  - : Một chuỗi đại diện cho tên lớp của thao tác sẽ được đăng ký. Đây là hàm tạo lớp được gọi khi thao tác được chạy.

### Giá trị trả về

Không có (`undefined`).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu:
    - Một thao tác đã được đăng ký với tên được chỉ định.
    - `operationCtor` không phải là một hàm tạo hợp lệ.
    - Lớp không chứa phương thức `run()` hợp lệ.
    - Module worklet chưa được thêm với {{domxref("Worklet.addModule", "SharedStorageWorklet.addModule()")}}.

## Ví dụ

```js
// ab-testing-worklet.js
class SelectURLOperation {
  async run(urls, data) {
    // Đọc nhóm thử nghiệm của người dùng từ shared storage
    const experimentGroup = await this.sharedStorage.get("ab-testing-group");

    // Trả về số nhóm
    return experimentGroup;
  }
}

register("ab-testing", SelectURLOperation);
```

Xem trang đích [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API) để xem hướng dẫn về ví dụ này và các liên kết đến các ví dụ khác.

> [!NOTE]
> Có thể định nghĩa và đăng ký nhiều thao tác trong cùng một script module shared storage worklet với các tên khác nhau; xem {{domxref("SharedStorageOperation")}} để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
