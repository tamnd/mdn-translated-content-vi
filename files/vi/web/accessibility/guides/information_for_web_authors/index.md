---
title: Thông tin trợ năng dành cho tác giả web
short-title: Information for web authors
slug: Web/Accessibility/Guides/Information_for_Web_authors
page-type: guide
sidebar: accessibilitysidebar
---

Tài liệu này liệt kê các hướng dẫn và quy định, các cách thực hiện, và các công cụ để kiểm tra và sửa các vấn đề trợ năng trên website.

## Hướng dẫn và quy định

- [Hướng dẫn thực hành Authoring Practices Guide (<abbr>APG</abbr>) của <abbr>ARIA</abbr>](https://www.w3.org/WAI/ARIA/apg/)
  - : Hướng dẫn về ngữ nghĩa trợ năng được định nghĩa bởi đặc tả Accessible Rich Internet Application (<abbr>ARIA</abbr>) để tạo ra trải nghiệm web có thể truy cập. Tài liệu mô tả cách áp dụng ngữ nghĩa trợ năng cho các mẫu thiết kế và widget phổ biến, đồng thời cung cấp mẫu thiết kế và ví dụ chức năng.
- [Hướng dẫn Trợ năng Nội dung Web (<abbr>WCAG</abbr>)](https://www.w3.org/WAI/standards-guidelines/wcag/)
  - : Một bộ hướng dẫn quan trọng khác từ _Sáng kiến Trợ năng Web (<abbr>WAI</abbr>)_ của W3C. Liên minh châu Âu đang xem xét dựa các quy định trợ năng sắp tới của họ trên những hướng dẫn này. Các hướng dẫn này được thảo luận trong [danh sách thảo luận của nhóm quan tâm <abbr>WAI</abbr>](https://www.w3.org/WAI/about/groups/waiig/#mailinglist).
- [ARIA trên trang này](/en-US/docs/Web/Accessibility/ARIA)
  - : Hướng dẫn của <abbr>MDN</abbr> về tất cả [vai trò ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) và [thuộc tính ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes), bao gồm thực hành tốt nhất, vai trò và thuộc tính liên quan, và ví dụ.

## Cách thực hiện

- [Trợ năng cho nhóm](https://digital.gov/guides/accessibility-for-teams/)
  - : Một hướng dẫn ngắn từ Technology Transformation Services của Cơ quan Quản lý Dịch vụ Tổng hợp Hoa Kỳ, bao quát nhiều chủ đề trợ năng cùng các liên kết tới video "cách làm" và các tham chiếu WCAG liên quan.
- [Tác giả hóa trang web có thể truy cập](https://www.ibm.com/able/requirements/requirements/)
  - : IBM đã công khai và tương tác các yêu cầu trợ năng của họ cần được đáp ứng.

## Công cụ kiểm tra và sửa tự động

Dùng công cụ để nhanh chóng kiểm tra các lỗi phổ biến ngay trong trình duyệt của bạn.

- [HTML CodeSniffer](https://squizlabs.github.io/HTML_CodeSniffer/)
- [aXe](https://chromewebstore.google.com/detail/axe-devtools-web-accessib/lhdoppojpmngadmnindnejefpokejbdd?hl=en-US)
- [Lighthouse Accessibility Audit](https://developer.chrome.com/docs/lighthouse/overview/)
- [Accessibility Insights](https://accessibilityinsights.io/)
- [<abbr>WAVE</abbr>](https://wave.webaim.org/extension/)

Công cụ tích hợp vào quy trình build để thêm các kiểm tra trợ năng theo chương trình, giúp bạn bắt lỗi khi đang phát triển ứng dụng web:

- [axe-core](https://github.com/dequelabs/axe-core)
- [jsx-a11y](https://github.com/jsx-eslint/eslint-plugin-jsx-a11y)
- [Lighthouse Audits](https://github.com/GoogleChrome/lighthouse/blob/main/docs/readme.md#using-programmatically)
- [AccessLint.js](https://github.com/accesslint/accesslint.js/tree/master)

Các công cụ {{glossary("Continuous integration")}} để tìm lỗi trợ năng trong pull request GitHub của bạn:

- [AccessLint](https://www.accesslint.com/)

Mặc dù tốt nhất là kiểm thử ứng dụng web của bạn với người dùng thực, bạn cũng có thể mô phỏng mù màu, thị lực kém, tương phản thấp, và zoom. Bạn nên luôn kiểm thử trang của mình khi không dùng chuột và cảm ứng để kiểm tra điều hướng bằng bàn phím. Bạn cũng có thể muốn thử trang của mình bằng lệnh thoại. Hãy thử tắt chuột và dùng các tiện ích mở rộng trình duyệt như [Web Disability Simulator](https://chromewebstore.google.com/detail/web-disability-simulator/olioanlbgbpmdlgjnnampnnlohigkjla)
