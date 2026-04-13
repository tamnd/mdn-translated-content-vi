---
title: "SharedStorageWorkletGlobalScope: thuộc tính sharedStorage"
short-title: sharedStorage
slug: Web/API/SharedStorageWorkletGlobalScope/sharedStorage
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.SharedStorageWorkletGlobalScope.sharedStorage
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Thuộc tính chỉ đọc **`context`** của giao diện {{domxref("SharedStorageWorkletGlobalScope")}} chứa một thể hiện đối tượng {{domxref("WorkletSharedStorage")}}, đại diện cho bộ lưu trữ dùng chung cho một nguồn gốc cụ thể như được hiển thị trong ngữ cảnh worklet.

## Giá trị

Một thể hiện đối tượng {{domxref("WorkletSharedStorage")}}.

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
