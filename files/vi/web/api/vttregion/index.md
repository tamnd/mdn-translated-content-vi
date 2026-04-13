---
title: VTTRegion
slug: Web/API/VTTRegion
page-type: web-api-interface
browser-compat: api.VTTRegion
---

{{APIRef("WebVTT")}}

Giao diện `VTTRegion` của [WebVTT API](/en-US/docs/Web/API/WebVTT_API) mô tả một phần của video để render {{domxref("VTTCue")}} trên đó.

## Hàm khởi tạo

- {{domxref("VTTRegion.VTTRegion", "VTTRegion()")}}
  - : Trả về một đối tượng `VTTRegion` mới được tạo.

## Thuộc tính phiên bản

- {{domxref("VTTRegion.id")}}
  - : Một chuỗi xác định vùng.
- {{domxref("VTTRegion.width")}}
  - : Đại diện cho chiều rộng của vùng, theo tỷ lệ phần trăm của video.
- {{domxref("VTTRegion.lines")}}
  - : Đại diện cho chiều cao của vùng, theo số dòng.
- {{domxref("VTTRegion.regionAnchorX")}}
  - : Đại diện cho độ lệch neo vùng theo trục X, theo tỷ lệ phần trăm của vùng.
- {{domxref("VTTRegion.regionAnchorY")}}
  - : Đại diện cho độ lệch neo vùng theo trục Y, theo tỷ lệ phần trăm của vùng.
- {{domxref("VTTRegion.viewportAnchorX")}}
  - : Đại diện cho độ lệch neo viewport theo trục X, theo tỷ lệ phần trăm của video.
- {{domxref("VTTRegion.viewportAnchorY")}}
  - : Đại diện cho độ lệch neo viewport theo trục Y, theo tỷ lệ phần trăm của video.
- {{domxref("VTTRegion.scroll")}}
  - : Một enum đại diện cho cách thêm một cue mới sẽ di chuyển các cue hiện có.

## Ví dụ

```js
const region = new VTTRegion();
region.width = 50; // Dùng 50% chiều rộng video
region.lines = 4; // Dùng 4 dòng chiều cao.
region.viewportAnchorX = 25; // Bắt đầu vùng ở 25% từ bên trái.
const cue = new VTTCue(2, 3, "Cool text to be displayed");
cue.region = region; // Cue này sẽ chỉ được vẽ trong vùng này.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
