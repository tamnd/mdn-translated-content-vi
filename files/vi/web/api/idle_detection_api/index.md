---
title: Idle Detection API
slug: Web/API/Idle_Detection_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.IdleDetector
---

{{securecontext_header}}{{DefaultAPISidebar("Idle Detection API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Idle Detection API cung cấp phương tiện để phát hiện trạng thái nhàn rỗi của người dùng, đặc biệt là trạng thái đang hoạt động, nhàn rỗi và bị khóa, và được thông báo về các thay đổi trạng thái nhàn rỗi mà không cần polling từ script.

## Khái niệm và cách sử dụng

Các ứng dụng gốc và tiện ích mở rộng trình duyệt sử dụng phát hiện nhàn rỗi để trải nghiệm người dùng dựa trên khi người dùng đang tương tác với thiết bị. Ví dụ, các ứng dụng chat có thể hiển thị cho người dùng khác của ứng dụng liệu ai đó có sẵn sàng không. Các ứng dụng khác có thể chọn chỉ hiển thị thông báo khi người dùng đang tương tác với ứng dụng. Ứng dụng web có thể sử dụng API này cho các trường hợp sử dụng tương tự.

## Các giao diện

- {{domxref("IdleDetector")}} {{Experimental_Inline}}
  - : Cung cấp các phương thức và sự kiện để phát hiện hoạt động của người dùng trên thiết bị hoặc màn hình.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
