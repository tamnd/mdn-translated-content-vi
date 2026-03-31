---
title: "Permissions-Policy: chỉ thị deferred-fetch-minimal"
short-title: deferred-fetch-minimal
slug: Web/HTTP/Reference/Headers/Permissions-Policy/deferred-fetch-minimal
page-type: http-permissions-policy-directive
status:
  - experimental
browser-compat: http.headers.Permissions-Policy.deferred-fetch-minimal
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị **`deferred-fetch-minimal`** của {{HTTPHeader("Permissions-Policy")}} là một phần của [Fetch API](/en-US/docs/Web/API/Fetch_API).

Chỉ thị này, cùng với {{HTTPHeader("Permissions-Policy/deferred-fetch", "deferred-fetch")}}, xác định cách phân phối giới hạn hạn mức tổng thể 640KiB giữa nguồn gốc cấp cao nhất và các subframe cross-origin của nó. Theo mặc định, nguồn gốc cấp cao nhất được cấp 512KiB, và mỗi subframe cross-origin được cấp 8KiB từ phần 128KiB còn lại. Permissions Policy `deferred-fetch-minimal` cũng có thể chặn tất cả các nguồn gốc; điều này sẽ tái phân bổ giới hạn chia sẻ 128KiB cho hạn mức cấp cao nhất, cho phép nó truy cập đầy đủ giới hạn 640KiB.

Xem [hạn mức `fetchLater()`](/en-US/docs/Web/API/Fetch_API/Using_Deferred_Fetch#quotas) để biết thêm chi tiết và ví dụ.

## Cú pháp

```http
Permissions-policy: deferred-fetch-minimal=*
Permissions-policy: deferred-fetch-minimal=()
Permissions-policy: deferred-fetch-minimal=(self)
Permissions-policy: deferred-fetch-minimal=(<url-list>)
```

- `<url-list>`
  - : Danh sách các nguồn gốc được phân cách bằng dấu cách được phép sử dụng hạn mức 128KiB thứ cấp (với tối đa 8KiB mỗi subframe).

Một frame cấp cao nhất với quyền `deferred-fetch-minimal` được đặt thành `self` hoặc `()` không cho phép hạn mức chia sẻ 128kb mặc định được sử dụng bởi các subframe cross-origin. Thay vào đó, hạn mức 128KiB cho các subframe được thêm vào hạn mức thông thường của nó.

## Chính sách mặc định

Danh sách cho phép mặc định cho `deferred-fetch-minimal` là `*`.

## Ví dụ

Xem [hạn mức `fetchLater()`](/en-US/docs/Web/API/Fetch_API/Using_Deferred_Fetch#quotas) để biết thêm ví dụ.

### Sử dụng hạn mức tối thiểu

```http
Permissions-Policy: deferred-fetch=(self "https://b.com")
```

1. Một subframe của `b.com` nhận 64KiB khi tạo, từ giới hạn 512KiB của cấp cao nhất.
2. Một subframe của `c.com` không được liệt kê và vì vậy nhận 8KiB khi tạo từ giới hạn chia sẻ 128KiB.
3. 15 subframe khác sẽ nhận 8KiB khi tạo (tương tự `c.com`, và một subframe `c.com` khác cũng sẽ nhận thêm hạn mức 8KiB).
4. Subframe tiếp theo sẽ không được cấp hạn mức nào.
5. Nếu một trong các subframe bị xóa, các fetch bị trì hoãn của nó sẽ được gửi.
6. Subframe tiếp theo sẽ nhận hạn mức 8KiB, vì có hạn mức có sẵn trở lại.

## Thu hồi hoàn toàn hạn mức tối thiểu với các ngoại lệ

```http
Permissions-Policy: deferred-fetch=(self "https://b.com")
Permissions-Policy: deferred-fetch-minimal=()
```

1. Một subframe của `b.com` nhận 64KiB khi tạo.
2. Một subframe của `c.com` không nhận hạn mức khi tạo.
3. Tài liệu cấp cao nhất và các hậu duệ cùng nguồn gốc của nó có thể sử dụng tối đa 640KiB đầy đủ, nhưng con số đó giảm xuống còn 574KiB nếu một subframe `b.com` được tạo.

## Thu hồi hoàn toàn hạn mức tối thiểu mà không có ngoại lệ

```http
Permissions-Policy: deferred-fetch-minimal=()
```

1. Tài liệu cấp cao nhất và các hậu duệ cùng nguồn gốc của nó có thể sử dụng đầy đủ 640KiB.
2. Các subframe không được phân bổ hạn mức và không thể sử dụng `fetchLater()`.

## Giới hạn hạn mức tối thiểu cho các nguồn gốc được đặt tên

```http
Permissions-Policy: deferred-fetch=(self "https://b.com")
Permissions-Policy: deferred-fetch-minimal=("https://c.com")
```

1. Một subframe của `b.com` nhận 64KiB khi tạo.
2. Một subframe của `c.com` nhận 8KiB khi tạo.
3. Một subframe của `d.com` không nhận hạn mức khi tạo.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fetch API](/en-US/docs/Web/API/Fetch_API)
- {{domxref("window.fetchLater()")}}
- Header {{HTTPHeader("Permissions-Policy")}}
- [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy)
