---
title: Translator and Language Detector APIs
slug: Web/API/Translator_and_Language_Detector_APIs
page-type: web-api-overview
status:
  - experimental
browser-compat: api.Translator
spec-urls: https://webmachinelearning.github.io/translation-api
---

{{DefaultAPISidebar("Translator and Language Detector APIs")}}{{SeeCompatTable}}{{securecontext_header}}

**Translator and Language Detector APIs** cung cấp chức năng phát hiện ngôn ngữ mà văn bản được viết bằng, và dịch văn bản sang các ngôn ngữ khác nhau, thông qua mô hình AI nội bộ của trình duyệt (có thể khác nhau giữa các trình duyệt).

## Khái niệm và cách sử dụng

Dịch một đoạn văn bản là tác vụ phổ biến trên web ngày nay. Các trường hợp sử dụng điển hình bao gồm:

- Dịch bài viết không có sẵn bằng ngôn ngữ của bạn theo thời gian thực.
- Dịch yêu cầu hỗ trợ của người dùng sang ngôn ngữ mà nhân viên hỗ trợ hiểu.
- Tạo điều kiện cho cuộc trò chuyện giữa những người dùng không nói ngôn ngữ của nhau.

Phát hiện ngôn ngữ của một đoạn văn bản là điều kiện tiên quyết quan trọng để dịch tự động thành công, nhưng có các ứng dụng khác ngoài dịch trực tiếp. Ví dụ, nó cho phép cấu hình UI tự động dựa trên nhập văn bản của người dùng, từ cập nhật chuỗi UI và lỗi, đến tự động tải từ điển thích hợp để kiểm tra chính tả hoặc phát hiện ngôn ngữ tục.

AI rất phù hợp để hỗ trợ phát hiện ngôn ngữ và dịch thuật. Translator and Language Detector APIs cung cấp các cơ chế bất đồng bộ (dựa trên {{jsxref("Promise")}}) để trang web phát hiện ngôn ngữ và dịch văn bản thông qua mô hình AI nội bộ của trình duyệt. Điều này hữu ích và hiệu quả vì trình duyệt xử lý dịch vụ, thay vì nhà phát triển phải dựa vào người dùng tải xuống các mô hình AI, hoặc lưu trữ hoặc trả tiền cho dịch vụ dịch thuật dựa trên đám mây.

- Phát hiện ngôn ngữ được thực hiện thông qua giao diện {{domxref("LanguageDetector")}}. Một phiên bản đối tượng `LanguageDetector` được tạo bằng phương thức tĩnh {{domxref("LanguageDetector.create_static", "LanguageDetector.create()")}}, sau đó phương thức phiên bản {{domxref("LanguageDetector.detect", "detect()")}} được truyền chuỗi văn bản để phát hiện ngôn ngữ.
- Dịch thuật được thực hiện thông qua giao diện {{domxref("Translator")}}. Một phiên bản đối tượng `Translator` được tạo bằng phương thức tĩnh {{domxref("Translator.create_static", "Translator.create()")}}, sau đó phương thức phiên bản {{domxref("Translator.translate", "translate()")}} được truyền chuỗi văn bản để dịch.

Bạn có thể hủy thao tác `create()`, `detect()`, hoặc `translate()` đang chờ bằng {{domxref("AbortController")}}.

Sau khi một phiên bản `LanguageDetector` hoặc `Translator` được tạo, bạn có thể giải phóng tài nguyên được gán và dừng mọi hoạt động tiếp theo bằng cách gọi phương thức {{domxref("LanguageDetector.destroy()")}}/{{domxref("Translator.destroy()")}} của nó. Bạn được khuyến khích thực hiện điều này sau khi đã hoàn thành với đối tượng vì nó có thể tiêu thụ nhiều tài nguyên.

Xem [Sử dụng Translator và Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using) để hướng dẫn cách sử dụng các API.

## Giao diện

- {{domxref("LanguageDetector")}} {{Experimental_Inline}}
  - : Chứa tất cả chức năng phát hiện ngôn ngữ, bao gồm kiểm tra tính khả dụng của mô hình AI, tạo phiên bản `LanguageDetector` mới, sử dụng nó để phát hiện ngôn ngữ, và nhiều hơn nữa.
- {{domxref("Translator")}} {{Experimental_Inline}}
  - : Chứa tất cả chức năng dịch thuật, bao gồm kiểm tra tính khả dụng của mô hình AI, tạo phiên bản `Translator` mới, sử dụng nó để tạo bản dịch, và nhiều hơn nữa.

## Tiêu đề HTTP

- {{httpheader("Permissions-Policy")}}; chỉ thị {{httpheader("Permissions-Policy/language-detector", "language-detector")}}
  - : Kiểm soát quyền truy cập vào chức năng phát hiện ngôn ngữ. Khi chính sách cụ thể không cho phép sử dụng nó, mọi nỗ lực gọi các phương thức `LanguageDetector` sẽ thất bại với `NotAllowedError` {{domxref("DOMException")}}.
- {{httpheader("Permissions-Policy")}}; chỉ thị {{httpheader("Permissions-Policy/translator", "translator")}}
  - : Kiểm soát quyền truy cập vào chức năng dịch thuật. Khi chính sách cụ thể không cho phép sử dụng nó, mọi nỗ lực gọi các phương thức `Translator` sẽ thất bại với `NotAllowedError` {{domxref("DOMException")}}.

## Xem xét bảo mật

Việc tạo các đối tượng `LanguageDetector` và `Translator` yêu cầu người dùng đã tương tác gần đây với trang ([kích hoạt người dùng thoáng qua](/en-US/docs/Web/Security/Defenses/User_activation) là bắt buộc).

Quyền truy cập vào API cũng được kiểm soát thông qua các chỉ thị {{httpheader("Permissions-Policy/language-detector", "language-detector")}} và {{httpheader("Permissions-Policy/translator", "translator")}} {{httpheader("Permissions-Policy")}}.

## Ví dụ

Để xem ví dụ đầy đủ, hãy xem [Sử dụng Translator và Language Detector APIs](/en-US/docs/Web/API/Translator_and_Language_Detector_APIs/Using).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Language detection with built-in AI](https://developer.chrome.com/docs/ai/language-detection) trên developer.chrome.com (2025)
- [Translation with built-in AI](https://developer.chrome.com/docs/ai/translator-api) trên developer.chrome.com (2025)
