---
title: "Được phân vùng: Tất cả yêu cầu truy cập lưu trữ bên thứ ba"
slug: Web/Privacy/Guides/Storage_Access_Policy/Errors/CookiePartitionedForeign
page-type: guide
sidebar: privacy
---

Một yêu cầu truy cập cookie hoặc lưu trữ đã bị _phân vùng_ vì nó đến từ bên thứ ba (một nguồn gốc khác) và [phân vùng trạng thái động](/en-US/docs/Web/Privacy/Guides/State_Partitioning#dynamic_partitioning) được bật.

## Thông báo

Firefox:

```plain
CookiePartitionedForeign=Partitioned cookie
or storage access was provided to "<URL>" because it is loaded in the
third-party context and storage partitioning is enabled.
```

## Có thể làm gì

Với tính năng Phân vùng trạng thái động được bật, Firefox cung cấp cho các tài nguyên nhúng một bucket lưu trữ riêng biệt cho mỗi trang web cấp cao nhất. Các bên thứ ba nhúng có thể yêu cầu quyền truy cập vào bucket lưu trữ cấp cao nhất qua [Storage Access API](/en-US/docs/Web/Privacy/Guides/State_Partitioning#storage_access_api). Bạn cũng có thể [vô hiệu hóa Phân vùng trạng thái động](/en-US/docs/Web/Privacy/Guides/State_Partitioning#disable_dynamic_state_partitioning) với tùy chọn `network.cookie.cookieBehavior`.

## Xem thêm

- [Phân vùng trạng thái](/en-US/docs/Web/Privacy/Guides/State_Partitioning)
