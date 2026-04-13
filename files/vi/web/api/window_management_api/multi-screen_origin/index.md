---
title: Gốc đa màn hình
slug: Web/API/Window_Management_API/Multi-screen_origin
page-type: guide
---

{{DefaultAPISidebar("Window Management API")}}

[Window Management API](/en-US/docs/Web/API/Window_Management_API) giới thiệu khái niệm **gốc đa màn hình** (multi-screen origin). Đây là tọa độ (0,0) của bố cục màn hình ảo của hệ điều hành (OS) máy chủ, xung quanh đó tất cả màn hình và cửa sổ có sẵn được định vị. Theo quy ước, gốc đa màn hình là góc trên bên trái của màn hình chính của hệ điều hành, mặc dù spec quy định rằng nó có thể là bất kỳ điểm tùy ý nào trong bố cục màn hình ảo.

Màn hình chính thường có thể được chỉ định bởi người dùng thông qua cài đặt hệ điều hành và thường chứa các tính năng giao diện hệ điều hành như thanh taskbar/icon dock.

> [!NOTE]
> Các giá trị tọa độ dương nằm về phía phải và phía dưới trong bố cục màn hình, trong khi các giá trị âm nằm về phía trái và phía trên.

## Ảnh hưởng đến các tính năng nền tảng web hiện có

Gốc đa màn hình liên quan đến các API sau:

- Các giá trị của {{domxref("ScreenDetailed.left")}}, {{domxref("ScreenDetailed.top")}}, {{domxref("ScreenDetailed.availLeft")}} và {{domxref("ScreenDetailed.availTop")}} cho mỗi màn hình có sẵn được báo cáo tương đối với gốc đa màn hình.
- Các giá trị của {{domxref("Window.screenLeft")}}, {{domxref("Window.screenTop")}}, {{domxref("Window.screenX")}}, {{domxref("Window.screenY")}} cho mỗi cửa sổ được báo cáo tương đối với gốc đa màn hình.
- Khi sử dụng {{domxref("Window.moveTo()")}} và {{domxref("Window.open()")}}, các cửa sổ được định vị tương đối với gốc đa màn hình.

> [!NOTE]
> Không phải tất cả các trình duyệt đều chính thức hỗ trợ gốc đa màn hình, nhưng một số có triển khai phi tiêu chuẩn riêng của họ. Bạn nên kiểm tra thông tin tương thích trình duyệt của các tính năng trên để biết hành vi trong từng trình duyệt.

## Ví dụ trực quan

Giả sử chúng ta có màn hình ngoài với độ phân giải 1920 x 1080 được đặt làm màn hình chính và màn hình laptop nội bộ với độ phân giải 1440 x 900 được đặt làm màn hình phụ. Giả sử rằng giao diện người dùng của hệ điều hành chiếm 25px ở đầu màn hình và chỉ được vẽ trên màn hình chính.

Nếu màn hình phụ được đặt trực tiếp bên phải màn hình chính, cạnh trên của màn hình thẳng hàng:

- Các giá trị `left`/`top` của màn hình chính sẽ là (0,0) trong khi các giá trị `availLeft`/`availTop` sẽ là (0,25) vì phải tính thêm độ dày của giao diện hệ điều hành.
- Các giá trị `left`/`top` của màn hình phụ sẽ là (1920,0) trong khi các giá trị `availLeft`/`availTop` sẽ là (1920,0) vì giao diện hệ điều hành không được vẽ trên màn hình phụ.

![Hai hình chữ nhật đại diện cho màn hình chính với màn hình phụ được đặt ở bên phải, như mô tả ở trên](/shared-assets/images/diagrams/api/window-management/primary-screen-left.svg)

Tuy nhiên, nếu màn hình phụ được đặt trực tiếp bên trái màn hình chính, cạnh trên của màn hình thẳng hàng:

- Các giá trị `left`/`top` của màn hình chính vẫn sẽ là (0,0) trong khi các giá trị `availLeft`/`availTop` sẽ là (0,25).
- Các giá trị `left`/`top` của màn hình phụ sẽ là (-1440,0) trong khi các giá trị `availLeft`/`availTop` sẽ là (-1440,0).

![Hai hình chữ nhật đại diện cho màn hình chính với màn hình phụ được đặt ở bên trái, như mô tả ở trên](/shared-assets/images/diagrams/api/window-management/primary-screen-right.svg)
