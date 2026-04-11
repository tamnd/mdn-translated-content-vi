---
title: "XRFrame: phương thức createAnchor()"
short-title: createAnchor()
slug: Web/API/XRFrame/createAnchor
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRFrame.createAnchor
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`createAnchor()`** của giao diện {{domxref("XRFrame")}} tạo một {{domxref("XRAnchor")}} nổi tự do, được cố định tương đối với thế giới thực.

Xem {{domxref("XRHitTestResult.createAnchor()")}} để tạo neo từ kết quả kiểm tra va chạm gắn liền với một đối tượng trong thế giới thực.

## Cú pháp

```js-nolint
createAnchor(pose, space)
```

### Tham số

- `pose`
  - : Một đối tượng {{domxref("XRRigidTransform")}} với tư thế ban đầu nơi neo sẽ được tạo. Hệ thống sẽ đảm bảo rằng mối quan hệ với thế giới vật lý được thiết lập tại thời điểm này được duy trì khi hệ thống theo dõi cập nhật hiểu biết về thế giới.
- `space`
  - : Một đối tượng {{domxref("XRSpace")}} mà tư thế tương đối với nó.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành một đối tượng {{domxref("XRAnchor")}}.

## Ví dụ

### Tạo neo

```js
frame.createAnchor(anchorPose, referenceSpace).then(
  (anchor) => {
    // Do stuff with the anchor (assign objects that will be relative to this anchor)
  },
  (error) => {
    console.error(`Could not create anchor: ${error}`);
  },
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRHitTestResult.createAnchor()")}}
