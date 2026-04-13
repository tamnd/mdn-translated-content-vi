---
title: "XRView: projectionMatrix property"
short-title: projectionMatrix
slug: Web/API/XRView/projectionMatrix
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRView.projectionMatrix
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`projectionMatrix`** của giao diện {{domxref("XRView")}} chỉ định ma trận chiếu áp dụng cho chế độ xem cơ bản. Ma trận này nên được sử dụng để tích hợp phối cảnh vào mọi thứ trong cảnh, để đảm bảo kết quả nhất quán với những gì mắt người dùng nhìn thấy.

> [!NOTE]
> Việc không áp dụng đúng phối cảnh, hoặc sự không nhất quán trong phối cảnh, có thể dẫn đến sự khó chịu hoặc đau khổ nghiêm trọng cho người dùng.

## Giá trị

Đối tượng {{jsxref("Float32Array")}} đại diện cho ma trận chiếu cho chế độ xem. Ma trận chiếu cho chế độ xem của mỗi mắt được dùng để đảm bảo rằng vùng chính xác của cảnh được trình bày cho mỗi mắt để tạo ra cảnh 3D đáng tin mà không gây khó chịu cho người dùng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
