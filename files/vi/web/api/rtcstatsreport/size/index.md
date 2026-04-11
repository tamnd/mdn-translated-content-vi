---
title: "RTCStatsReport: size property"
short-title: size
slug: Web/API/RTCStatsReport/size
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.size
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`size`** của giao diện {{domxref("RTCStatsReport")}} trả về số lượng mục trong báo cáo hiện tại.

Lưu ý rằng mỗi mục gồm một cặp khóa-giá trị, trong đó các khóa là các giá trị `id` duy nhất của các đối tượng thống kê được giám sát, và các giá trị đi kèm là [đối tượng dictionary thống kê](/en-US/docs/Web/API/RTCStatsReport#the_statistic_types).

Thuộc tính này tương tự với {{jsxref("Map.prototype.size")}}.

## Giá trị

Một số nguyên cho biết số lượng mục trong báo cáo này.
Giá trị là zero nếu báo cáo rỗng.

## Tiêu chuẩn

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map")}}
