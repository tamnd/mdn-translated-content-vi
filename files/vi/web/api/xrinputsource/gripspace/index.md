---
title: "XRInputSource: gripSpace property"
short-title: gripSpace
slug: Web/API/XRInputSource/gripSpace
page-type: web-api-instance-property
browser-compat: api.XRInputSource.gripSpace
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`gripSpace`** của {{domxref("XRInputSource")}} trả về một {{domxref("XRSpace")}} có gốc bản địa theo dõi tư thế dùng để kết xuất các đối tượng ảo sao cho chúng trông như được cầm trong (hoặc là một phần của) tay người dùng. Ví dụ, nếu người dùng đang cầm một thanh thẳng ảo, gốc bản địa của `XRSpace` này sẽ nằm ở khoảng trung tâm khối lượng của nắm tay người dùng.

## Giá trị

Một đối tượng {{domxref("XRSpace")}} đại diện cho vị trí và hướng của thiết bị đầu vào trong không gian ảo, phù hợp để kết xuất hình ảnh của thiết bị vào cảnh. `gripSpace` là `null` nếu nguồn đầu vào vốn không có thể theo dõi được. Ví dụ, chỉ các đầu vào có {{domxref("XRInputSource.targetRayMode", "targetRayMode")}} là `tracked-pointer` mới cung cấp `gripSpace`.

Hãy tưởng tượng bộ điều khiển có hình dạng như một thanh thẳng, được cầm trong nắm tay người dùng. Gốc bản địa của không gian grip nằm ở trọng tâm, tức là trung tâm khối lượng của nắm tay người dùng, theo dõi vị trí của tay người dùng.

**Hệ tọa độ cho không gian grip của tay trái.**

![Sơ đồ hiển thị cách không gian grip chỉ ra hệ tọa độ cục bộ cho tay người chơi so với thế giới.](gripspace-lefthand-light.svg)

**Hệ tọa độ cho không gian grip của tay phải.**

![Sơ đồ hiển thị cách không gian grip chỉ ra hệ tọa độ cục bộ cho tay người chơi so với thế giới.](gripspace-righthand-light.svg)

Như được hiển thị trong sơ đồ trên, hệ tọa độ được định hướng như sau:

- Trục x vuông góc với lòng bàn tay của người dùng, hướng mở rộng ra phía sau tay là +X nếu bộ điều khiển ở tay phải hoặc -X nếu ở tay trái.
- Trục z dọc theo chiều dài của thanh, song song với lòng bàn tay và dọc theo chiều dài nắm tay. -Z theo hướng ngón tay cái của người dùng, và +Z theo hướng ngược lại.
- Trục y được suy ra từ mối quan hệ giữa hai trục kia; như thường lệ, đó là tích có hướng của hai trục kia (nằm cách 90° so với cả trục X và Z).

## Ví dụ

Trong ví dụ này, lấy từ callback kết xuất khung hình, `gripSpace` được dùng để kết xuất một mesh đại diện cho vị trí và hướng của bộ điều khiển trong môi trường ảo.

```js
for (const source in xrSession.inputSources) {
  if (source.gripSpace) {
    const gripPose = frame.getPose(source.gripSpace, xrRefSpace);

    if (gripPose) {
      myDrawMeshUsingTransform(controllerMesh, gripPose.transform.matrix);
    }
  }
}
```

Đối với mỗi nguồn đầu vào có giá trị `gripSpace`, vòng lặp này lấy {{domxref("XRPose")}} đại diện cho vị trí và hướng được mô tả bởi `gripSpace`. Nếu tư thế hợp lệ được trả về, một phương thức `myDrawMeshUsingTransform()` được gọi để vẽ mesh của bộ điều khiển được biến đổi bằng ma trận biến đổi của tư thế grip.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
