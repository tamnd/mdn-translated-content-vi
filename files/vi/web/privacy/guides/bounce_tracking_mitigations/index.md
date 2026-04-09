---
title: Các biện pháp giảm thiểu bounce tracking
slug: Web/Privacy/Guides/Bounce_tracking_mitigations
page-type: guide
spec-urls: https://privacycg.github.io/nav-tracking-mitigations/#bounce-tracking-mitigations
sidebar: privacy
---

**Các biện pháp giảm thiểu bounce tracking** (một số trình duyệt gọi là **bảo vệ bounce tracking**) là một tính năng nâng cao quyền riêng tư người dùng bằng cách bảo vệ khỏi **bounce tracking**. Bài viết này giải thích bounce tracking là gì và các biện pháp giảm thiểu bounce tracking hoạt động như thế nào.

## Định nghĩa bounce tracking

Bounce tracking (còn gọi là **redirect tracking**) là việc lạm dụng điều hướng giữa các site, trong đó một bộ theo dõi chuyển hướng người dùng tới trang của nó nhằm đặt cookie bên thứ nhất để theo dõi người dùng đó trên các site khác. Việc chuyển hướng có thể xảy ra nhanh đến mức người dùng thậm chí không nhận ra.

Về bản chất, bounce tracking cho phép đặt cookie theo dõi ngay cả khi trình duyệt đã [cookie bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies) bị tắt.

Bounce tracking có thể được thực hiện theo vài cách khác nhau:

1. Theo kiểu "bounce back". Trong trường hợp này, người dùng bắt đầu ở một website (`site1.example`), được điều hướng tới một site theo dõi (`tracker.example`) nơi cookie theo dõi được đặt, rồi sau đó được chuyển hướng quay lại `site1.example`.

   <!--

   Mermaid JS source:

   flowchart LR
      A["site1.example"] -- &nbsp;&nbsp;1: Navigate&nbsp;&nbsp; --&gt; B["tracker.example"]
      B -- &nbsp;&nbsp;2: Store cookie&nbsp;&nbsp; --&gt; C[("Browser")]
      B -- &nbsp;&nbsp;3: Redirect&nbsp;&nbsp; --&gt; A

   https://www.mermaidchart.com/ was used to generate the chart, with the "Default theme"

   -->

   ![Minh họa ví dụ bounce back](bounce-back.svg)

2. Theo kiểu "bounce through". Trong trường hợp này, người dùng bắt đầu ở một website (`site1.example`), được điều hướng tới một site theo dõi (`tracker.example`) nơi cookie theo dõi được đặt, rồi sau đó được chuyển hướng tới một site khác (`site2.example`).

      <!--
   
   Mermaid JS source:
   
   flowchart LR
     A["site1.example"] -- &nbsp;&nbsp;1: Navigate&nbsp;&nbsp; --&gt; B["tracker.example"]
     B -- &nbsp;&nbsp;3: Redirect&nbsp;&nbsp; --&gt; C["site2.example"]
     B -- &nbsp;&nbsp;2: Store cookie&nbsp;&nbsp; --&gt; D[(Browser)]
   
   
   https://www.mermaidchart.com/ was used to generate the chart, with the "Default theme"
   
   -->

   ![Minh họa ví dụ bounce through](bounce-through.svg)

Trong cả hai trường hợp, người dùng có thể không biết rằng họ đã truy cập `tracker.example`. Họ có thể nghĩ rằng họ chỉ truy cập `site1.example` hoặc đã cố điều hướng tới `site2.example`.

## Cách các biện pháp giảm thiểu bounce tracking hoạt động

Các biện pháp giảm thiểu bounce tracking hoạt động bằng cách nhận diện site theo dõi bằng heuristic và định kỳ xóa cookie cùng các dữ liệu trạng thái khác liên quan đến chúng (các ví dụ khác bao gồm [`localStorage`](/en-US/docs/Web/API/Web_Storage_API), [IndexedDB](/en-US/docs/Web/API/IndexedDB_API), [Cache API](/en-US/docs/Web/API/CacheStorage), và dữ liệu trạng thái mạng). Tính năng này không dùng danh sách chặn hoặc cho phép để quyết định website nào bị ảnh hưởng.

Điều quan trọng là khi bảo vệ chống bounce tracking, trình duyệt không được can thiệp vào các luồng chuyển hướng hợp pháp, không dùng để theo dõi. Ví dụ, đăng nhập một lần (SSO), [liên kết danh tính](/en-US/docs/Web/API/FedCM_API#fedcm_concepts), và các dịch vụ thanh toán thường liên quan đến việc chuyển hướng người dùng tới một site khác nơi họ thực hiện một hành động, cập nhật thông tin trạng thái, rồi chuyển hướng họ trở lại site gốc.

Quá trình hoạt động như sau:

1. Trình duyệt giám sát các điều hướng và gắn cờ những site là một phần của "bounce", tức là các site mà qua đó một điều hướng đã bị chuyển hướng. Điều này bao gồm cả chuyển hướng do máy chủ khởi tạo và chuyển hướng phía client nơi JavaScript kích hoạt điều hướng theo chương trình.
2. Trình duyệt định kỳ kiểm tra danh sách site đã gắn cờ của nó và xem liệu người dùng có từng chủ động dùng site đó bằng cách tương tác trong 45 ngày gần nhất hay không. Ví dụ tương tác gồm nhấp nút, nhập dữ liệu vào form, và cuộn trang. Tương tác có thể xảy ra trước, trong, hoặc sau khi bounce được phát hiện.
3. Nếu site không có bất kỳ tương tác người dùng nào và cookie bên thứ ba bị chặn, thì trạng thái của nó sẽ bị xóa.

Heuristic này hoạt động trên {{glossary("site", "site")}}. Kết quả là cả `foo.site1.example` và `bar.site1.example` đều được coi là `site1.example`.

### Bounce có trạng thái so với không trạng thái

Các triển khai trước đây chỉ gắn cờ những site thuộc một "bounce có trạng thái", tức là một "bounce" nơi site chuyển hướng đặt thông tin trạng thái (như cookie). Điều này đã được thay đổi vì các dạng trạng thái khác - như trạng thái mạng - được đặt tự động nhưng vẫn có thể bị lợi dụng để theo dõi người dùng. Khi xét những dạng trạng thái này, mọi bounce thực chất đều có trạng thái, nên không hữu ích nếu xem "bounce có trạng thái" là một nhóm riêng.

Vì vậy, các triển khai đã được cập nhật để hoạt động ở "chế độ không trạng thái".

## Thông số kỹ thuật

{{specifications}}

## Hỗ trợ trình duyệt

- Triển khai bounce tracking mitigations của Chromium đã được phát hành trong phiên bản 116, và hoạt động khi cài đặt người dùng chặn cookie bên thứ ba. Chromium chỉ tắt cookie bên thứ ba theo mặc định khi ở chế độ Chrome Incognito (hoặc tương đương trong các trình duyệt khác, như InPrivate của Microsoft Edge). Các trình duyệt dựa trên engine kết xuất không phải Chromium luôn chặn cookie bên thứ ba theo mặc định.
- Firefox [hỗ trợ bảo vệ bounce tracking](https://firefox-source-docs.mozilla.org/toolkit/components/antitracking/anti-tracking/bounce-tracking-protection/) khi [Enhanced Tracking Protection](https://support.mozilla.org/en-US/kb/enhanced-tracking-protection-firefox-desktop) được đặt ở chế độ strict.
  - Firefox đã giữ các tính năng [redirect tracking protection](/en-US/docs/Web/Privacy/Guides/Redirect_tracking_protection) hiện có cùng với bounce tracking protection vì nó cung cấp một cách tiếp cận đa trình duyệt không phụ thuộc vào danh sách tracker đã biết.
  - Firefox đã cập nhật triển khai của mình để chạy ở chế độ không trạng thái trong [phiên bản 145](/en-US/docs/Mozilla/Firefox/Releases/145).
- Safari không triển khai bounce tracking mitigations như được định nghĩa trong [đặc tả](#specifications). Safari có cơ chế riêng dựa trên danh sách để bảo vệ bounce tracking, được phát hành lần đầu trong [ITP 2.0](https://webkit.org/blog/8311/intelligent-tracking-prevention-2-0/). Xem thêm phần mô tả [Safari](https://privacycg.github.io/nav-tracking-mitigations/#mitigations-safari) trong đặc tả.
