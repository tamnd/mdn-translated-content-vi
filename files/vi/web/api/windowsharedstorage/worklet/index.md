---
title: "WindowSharedStorage: thuộc tính worklet"
short-title: worklet
slug: Web/API/WindowSharedStorage/worklet
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.WindowSharedStorage.worklet
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Thuộc tính chỉ đọc **`worklet`** của giao diện {{domxref("WindowSharedStorage")}} chứa phiên bản {{domxref("SharedStorageWorklet")}} đại diện cho worklet bộ nhớ dùng chung cho nguồn gốc hiện tại.

`SharedStorageWorklet` chứa phương thức {{domxref("Worklet.addModule", "addModule()")}}, được sử dụng để thêm module vào worklet bộ nhớ dùng chung.

## Giá trị

Một đối tượng {{domxref("SharedStorageWorklet")}}.

## Ví dụ

```js
// Randomly assigns a user to a group 0 or 1
function getExperimentGroup() {
  return Math.round(Math.random());
}

async function injectContent() {
  // Add the module to the shared storage worklet
  await window.sharedStorage.worklet.addModule("ab-testing-worklet.js");

  // Assign user to a random group (0 or 1) and store it in shared storage
  window.sharedStorage.set("ab-testing-group", getExperimentGroup(), {
    ignoreIfPresent: true,
  });

  // Run the URL selection operation
  const fencedFrameConfig = await window.sharedStorage.selectURL(
    "ab-testing",
    [
      { url: `https://your-server.example/content/default-content.html` },
      { url: `https://your-server.example/content/experiment-content-a.html` },
    ],
    {
      resolveToConfig: true,
    },
  );

  // Render the chosen URL into a fenced frame
  document.getElementById("content-slot").config = fencedFrameConfig;
}

injectContent();
```

Xem trang đích [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API) để được hướng dẫn về ví dụ này và các liên kết đến các ví dụ khác.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
