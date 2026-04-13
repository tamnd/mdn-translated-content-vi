---
title: Summarizer API
slug: Web/API/Summarizer_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.Summarizer
spec-urls: https://webmachinelearning.github.io/writing-assistance-apis/#summarizer-api
---

{{SeeCompatTable}}{{DefaultAPISidebar("Summarizer API")}}

**Summarizer API** tóm tắt một đoạn văn bản nhất định thông qua mô hình AI nội bộ của trình duyệt (có thể khác nhau giữa các trình duyệt).

## Khái niệm và cách sử dụng

Viết tóm tắt một đoạn văn bản lớn hơn là một tác vụ viết lách phổ biến, và AI rất phù hợp với điều này. Các trường hợp sử dụng điển hình bao gồm:

- Cung cấp tóm tắt của một bài viết đầy đủ để người đọc có thể đánh giá liệu có nên đọc toàn bộ hay không.
- Tóm tắt bản ghi cuộc họp để những người tham gia muộn có thể cập nhật những gì họ đã bỏ lỡ.
- Tóm tắt một tập hợp đánh giá sản phẩm để nhanh chóng truyền đạt cảm xúc tổng thể.

Summarizer API cung cấp một cơ chế bất đồng bộ (dựa trên {{jsxref("Promise")}}) cho trang web để đưa một đoạn văn bản vào mô hình AI nội bộ của trình duyệt và yêu cầu nó trả về tóm tắt của văn bản dựa trên các tùy chọn được chỉ định.

Điều này được thực hiện bằng chức năng được cung cấp bởi giao diện {{domxref("Summarizer")}}, theo quy trình hai bước:

1. Tạo một phiên bản đối tượng `Summarizer` bằng phương thức tĩnh {{domxref("Summarizer.create_static", "Summarizer.create()")}}, chỉ định các tùy chọn cho loại tóm tắt bạn muốn. Các tùy chọn bao gồm độ dài, loại (ví dụ: "tldr" hoặc các điểm chính), định dạng (plain text hoặc markdown), và ngôn ngữ đầu vào và đầu ra.
   > [!NOTE]
   > Nếu bạn muốn kiểm tra liệu mô hình AI trình duyệt có thể hỗ trợ sở thích của bạn hay không, bạn có thể làm điều đó với phương thức tĩnh {{domxref("Summarizer.availability_static", "Summarizer.availability()")}}.
2. Chạy phương thức phiên bản {{domxref("Summarizer.summarize()")}} để yêu cầu tóm tắt.

Bạn có thể hủy thao tác `create()` hoặc `summarize()` đang chờ bằng cách dùng {{domxref("AbortController")}}.

Sau khi phiên bản `Summarizer` được tạo, bạn có thể giải phóng các tài nguyên được gán và dừng mọi hoạt động tiếp theo bằng cách gọi phương thức {{domxref("Summarizer.destroy()")}} của nó. Bạn được khuyến khích làm điều này sau khi bạn đã sử dụng xong đối tượng `Summarizer` vì nó có thể tiêu thụ nhiều tài nguyên.

Xem [Using the Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using) để có hướng dẫn về cách API hoạt động.

## Giao diện

- {{domxref("Summarizer")}} {{Experimental_Inline}}
  - : Chứa tất cả chức năng của Summarizer API, bao gồm kiểm tra tính khả dụng của mô hình AI, tạo phiên bản `Summarizer` mới, sử dụng nó để tạo tóm tắt mới, và nhiều hơn nữa.

## HTTP headers

- {{httpheader("Permissions-Policy")}}; chỉ thị {{httpheader('Permissions-Policy/summarizer','summarizer')}}
  - : Kiểm soát quyền truy cập vào Summarizer API. Nếu chính sách cụ thể không cho phép sử dụng Summarizer API, mọi cố gắng gọi các phương thức của API sẽ thất bại với `NotAllowedError` {{domxref("DOMException")}}.

## Cân nhắc bảo mật

Đặc tả yêu cầu người dùng phải tương tác gần đây với trang khi tạo đối tượng `Summarizer` ([kích hoạt người dùng tạm thời](/en-US/docs/Web/Security/Defenses/User_activation) là bắt buộc).

Ngoài ra, đặc tả kiểm soát quyền truy cập vào API thông qua các chỉ thị {{httpheader('Permissions-Policy/summarizer','summarizer')}} {{httpheader("Permissions-Policy")}}.

## Ví dụ

Xem ví dụ đầy đủ tại [Using the Summarizer API](/en-US/docs/Web/API/Summarizer_API/Using).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Summarize with built-in AI](https://developer.chrome.com/docs/ai/summarizer-api) trên developer.chrome.com (2025)
- [Web AI demos](https://chrome.dev/web-ai-demos/) trên chrome.dev
