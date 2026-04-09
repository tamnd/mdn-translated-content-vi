---
title: Common XSLT Errors
slug: Web/XML/XSLT/Guides/Common_errors
page-type: guide
sidebar: xmlsidebar
---

## MIME types

Máy chủ của bạn cần gửi cả nguồn và stylesheet với MIME type XML, `text/xml` hoặc `application/xml`. Để biết kiểu hiện tại, hãy tải tệp trong Mozilla và xem thông tin trang. Hoặc dùng công cụ tải xuống, vì chúng thường cho biết MIME type.

Trong Firefox 6 trở về sau, bạn cũng có thể dùng MIME type XSLT chính thức: `application/xslt+xml`.

## Namespace

Namespace XSLT 1.0 là [`http://www.w3.org/1999/XSL/Transform`](https://www.w3.org/1999/XSL/Transform). Các phiên bản IE cũ đã dùng một namespace khác. Tuy nhiên các phiên bản đó cũng dùng một bản nháp của XSLT không tương thích với thứ cuối cùng trở thành đặc tả XSLT 1.0. Firefox chỉ hỗ trợ phiên bản XSLT 1.0 chính thức.

## Tính năng còn thiếu

Có một số tính năng trong đặc tả XSLT 1.0 mà Firefox hiện chưa hỗ trợ. Cụ thể:

- Trục `namespace::` trong biểu thức XPath. Hy vọng hỗ trợ cho phần này sẽ có trong tương lai.
- Thuộc tính `disable-output-escaping`. Tính năng này điều khiển cách hoạt động của việc tuần tự hóa tài liệu đầu ra đã được tạo. Tuy nhiên Firefox không bao giờ tuần tự hóa tài liệu đầu ra nên thuộc tính này thực ra không áp dụng. Dù chúng tôi có thể thử thêm một số heuristic để tuần tự hóa và phân tích lại chỉ phần tài liệu đầu ra có áp dụng `disable-output-escaping`, heuristic thường sai và dẫn đến kết quả bất ngờ, vì vậy đến nay chúng tôi vẫn chưa muốn thêm điều này. Thường thì stylesheet chứa mã như `<xsl:text disable-output-escaping="yes">&nbsp;</xsl:text>`, điều này tương đương với việc đặt `&#160;` trong stylesheet và sẽ hoạt động tốt trong mọi bộ máy XSLT. Chúng tôi hiểu rằng việc thiếu `disable-output-escaping` là một vấn đề và muốn tìm ra giải pháp, nhưng đến nay vẫn chưa tìm được giải pháp tốt nào.
- Phần tử `<xsl:namespace-alias>`.

Nếu bạn muốn giúp đỡ với bất kỳ tính năng nào ở trên, sự hỗ trợ sẽ rất được trân trọng.
