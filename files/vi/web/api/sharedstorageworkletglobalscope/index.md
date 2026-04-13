---
title: SharedStorageWorkletGlobalScope
slug: Web/API/SharedStorageWorkletGlobalScope
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.SharedStorageWorkletGlobalScope
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Giao diện **`SharedStorageWorkletGlobalScope`** của {{domxref("Shared Storage API", "Shared Storage API", "", "nocode")}} đại diện cho phạm vi toàn cục của module {{domxref("SharedStorageWorklet")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("SharedStorageWorkletGlobalScope.sharedStorage", "sharedStorage")}} {{deprecated_inline}}
  - : Chứa một thể hiện của đối tượng {{domxref("WorkletSharedStorage")}}, đại diện cho bộ lưu trữ dùng chung cho một nguồn gốc cụ thể như được hiển thị trong ngữ cảnh worklet.

## Phương thức phiên bản

- {{domxref("SharedStorageWorkletGlobalScope.register", "register()")}} {{deprecated_inline}}
  - : Đăng ký một {{domxref("SharedStorageOperation", "thao tác", "", "nocode")}} được định nghĩa bên trong module worklet hiện tại.

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
