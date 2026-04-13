# UI Translation TODO

This file tracks all UI strings and components that need Vietnamese translation.

The MDN UI is built using [Project Fluent](https://projectfluent.org/) `.ftl` files located at:
`node_modules/@mdn/fred/l10n/locales/`

Since our build overlays Vietnamese content onto `en-US` slugs, the fred SSR renders pages
with en-US UI strings. We fix this via two mechanisms:

1. **`vi.ftl`** – Created at `node_modules/@mdn/fred/l10n/locales/vi.ftl` (and
   maintained in `translate/vi.ftl` in this repo, copied during build)
2. **HTML post-processing** – `mdn-worker/scripts/export-static.mjs` replaces baked-in
   English strings in the SSR output.

---

## Status

| Area                                                            | Status  | Notes                         |
| --------------------------------------------------------------- | ------- | ----------------------------- |
| Navigation (skip links, toggle sidebar)                         | ✅ Done | via HTML replacement          |
| Article TOC header ("In this article")                          | ✅ Done | via vi.ftl + HTML replacement |
| Article footer (GitHub, contribute, feedback)                   | ✅ Done | via HTML replacement          |
| Baseline indicators                                             | ✅ Done | via HTML replacement          |
| Compat table labels                                             | ✅ Done | via HTML replacement          |
| Footer links                                                    | ✅ Done | via HTML replacement          |
| Color theme switcher                                            | ✅ Done | via HTML replacement          |
| Search UI                                                       | ✅ Done | via HTML replacement          |
| Copy button                                                     | ✅ Done | via HTML replacement          |
| Sidebar section labels (Constructor, Instance methods, Events…) | ✅ Done | via HTML replacement          |
| 404 page                                                        | ✅ Done | via HTML replacement          |
| Homepage hero                                                   | ✅ Done | via HTML replacement          |
| Language switcher                                               | ✅ Done | via HTML replacement          |
| Pagination                                                      | ✅ Done | via HTML replacement          |

---

## Full string list (en-US.ftl → vi)

### Article footer

| ID                                              | English                                                | Vietnamese                                                           |
| ----------------------------------------------- | ------------------------------------------------------ | -------------------------------------------------------------------- |
| article-footer-last-modified                    | This page was last modified on ... by MDN contributors | Trang này được sửa đổi lần cuối vào ... bởi những người đóng góp MDN |
| article-footer-title                            | Help improve MDN                                       | Giúp cải thiện MDN                                                   |
| article-footer-learn-how-to-contribute          | Learn how to contribute                                | Tìm hiểu cách đóng góp                                               |
| article-footer-view-this-page-on-github         | View this page on GitHub                               | Xem trang này trên GitHub                                            |
| article-footer-report-a-problem-with-this-conte | Report a problem with this content                     | Báo cáo sự cố với nội dung này                                       |

### Navigation

| ID                                | English              | Vietnamese                |
| --------------------------------- | -------------------- | ------------------------- |
| a11y-menu-skip-to-main-content    | Skip to main content | Chuyển đến nội dung chính |
| a11y-menu-skip-to-search          | Skip to search       | Chuyển đến tìm kiếm       |
| navigation-toggle-navigation      | Toggle navigation    | Bật/tắt điều hướng        |
| toggle-sidebar-toggle-sidebar     | Toggle sidebar       | Ẩn/hiện thanh bên         |
| sidebar-filter-filter-sidebar     | Filter sidebar       | Lọc thanh bên             |
| sidebar-filter-filter             | Filter               | Lọc                       |
| sidebar-filter-clear-filter-input | Clear filter input   | Xóa bộ lọc                |
| reference-toc-header              | In this article      | Trong bài này             |
| generic-toc\_\_header             | In this article      | Trong bài này             |

### Compat table

| ID                       | English                                                     | Vietnamese                                              |
| ------------------------ | ----------------------------------------------------------- | ------------------------------------------------------- |
| compat-support-full      | Full support                                                | Hỗ trợ đầy đủ                                           |
| compat-support-partial   | Partial support                                             | Hỗ trợ một phần                                         |
| compat-support-no        | No support                                                  | Không hỗ trợ                                            |
| compat-support-unknown   | Support unknown                                             | Không rõ hỗ trợ                                         |
| compat-deprecated        | Deprecated                                                  | Đã lỗi thời                                             |
| compat-experimental      | Experimental                                                | Thử nghiệm                                              |
| compat-nonstandard       | Non-standard                                                | Không chuẩn                                             |
| compat-no                | No                                                          | Không                                                   |
| compat-yes               | Yes                                                         | Có                                                      |
| compat-loading           | Loading…                                                    | Đang tải…                                               |
| compat-js-required       | Enable JavaScript to view this browser compatibility table. | Bật JavaScript để xem bảng tương thích trình duyệt này. |
| compat-legend            | Legend                                                      | Chú giải                                                |
| compat-legend-tip        | Tip: you can click/tap on a cell for more information.      | Mẹo: nhấp/chạm vào ô để biết thêm thông tin.            |
| compat-link-report-issue | Report problems with this compatibility data                | Báo cáo sự cố với dữ liệu tương thích này               |
| compat-link-source       | View data on GitHub                                         | Xem dữ liệu trên GitHub                                 |

### Baseline

| ID                                        | English                | Vietnamese             |
| ----------------------------------------- | ---------------------- | ---------------------- |
| baseline-indicator-widely-available       | Widely available       | Khả dụng rộng rãi      |
| baseline-indicator-newly-available        | Newly available        | Mới khả dụng           |
| baseline-indicator-limited-availability   | Limited availability   | Khả dụng hạn chế       |
| baseline-indicator-learn-more             | Learn more             | Tìm hiểu thêm          |
| baseline-indicator-see-full-compatibility | See full compatibility | Xem tương thích đầy đủ |

### Search

| ID                                | English               | Vietnamese                 |
| --------------------------------- | --------------------- | -------------------------- |
| search-button-search-the-site     | Search the site       | Tìm kiếm trên trang        |
| search-modal-search               | Search                | Tìm kiếm                   |
| search-modal-exit-search          | Exit search           | Đóng tìm kiếm              |
| search-modal-loading-search-index | Loading search index… | Đang tải chỉ mục tìm kiếm… |
| site-search-searching             | Searching…            | Đang tìm kiếm…             |
| site-search-previous              | Previous              | Trước                      |
| site-search-next                  | Next                  | Tiếp theo                  |
| site-search-suggestions-text      | Did you mean…         | Ý bạn là…                  |

### Copy button

| ID                      | English      | Vietnamese         |
| ----------------------- | ------------ | ------------------ |
| copy-button-copy        | Copy         | Sao chép           |
| copy-button-copied      | Copied       | Đã sao chép        |
| copy-button-copy-failed | Copy failed! | Sao chép thất bại! |

### Color theme

| ID                             | English            | Vietnamese            |
| ------------------------------ | ------------------ | --------------------- |
| theme-default                  | OS default         | Mặc định hệ điều hành |
| color-theme-light              | Light              | Sáng                  |
| color-theme-dark               | Dark               | Tối                   |
| color-theme-switch-color-theme | Switch color theme | Đổi giao diện màu     |

### Content feedback

| ID                        | English                               | Vietnamese                               |
| ------------------------- | ------------------------------------- | ---------------------------------------- |
| content-feedback-question | Was this page helpful to you?         | Trang này có hữu ích với bạn không?      |
| content-feedback-yes      | Yes                                   | Có                                       |
| content-feedback-no       | No                                    | Không                                    |
| content-feedback-reason   | Why was this page not helpful to you? | Tại sao trang này không hữu ích với bạn? |
| content-feedback-submit   | Submit                                | Gửi                                      |
| content-feedback-thanks   | Thank you for your feedback!          | Cảm ơn phản hồi của bạn!                 |

### Footer

| ID                                      | English                               | Vietnamese                         |
| --------------------------------------- | ------------------------------------- | ---------------------------------- |
| footer-tagline                          | Your blueprint for a better internet. | Nền tảng cho một internet tốt hơn. |
| footer-about                            | About                                 | Giới thiệu                         |
| footer-blog                             | Blog                                  | Blog                               |
| footer-contribute                       | Contribute                            | Đóng góp                           |
| footer-learn-web-development            | Learn web development                 | Học phát triển web                 |
| footer-web-technologies                 | Web technologies                      | Công nghệ web                      |
| footer-glossary                         | Glossary                              | Thuật ngữ                          |
| footer-community-resources              | Community resources                   | Tài nguyên cộng đồng               |
| footer-advertise-with-us                | Advertise with us                     | Quảng cáo với chúng tôi            |
| footer-legal                            | Legal                                 | Pháp lý                            |
| footer-website-privacy-notice           | Website Privacy Notice                | Thông báo quyền riêng tư           |
| footer-community-participation-guidelin | Community Participation Guidelines    | Hướng dẫn tham gia cộng đồng       |

### Pagination

| ID              | English       | Vietnamese      |
| --------------- | ------------- | --------------- |
| pagination-next | Next page     | Trang tiếp theo |
| pagination-prev | Previous page | Trang trước     |

### 404 page

| ID              | English                  | Vietnamese           |
| --------------- | ------------------------ | -------------------- |
| not-found-title | Page not found           | Không tìm thấy trang |
| not-found-back  | Go back to the home page | Quay lại trang chủ   |

### Language switcher

| ID                                  | English           | Vietnamese       |
| ----------------------------------- | ----------------- | ---------------- |
| language-switcher-remember-language | Remember language | Ghi nhớ ngôn ngữ |

### Sidebar section headings (from rari/fred components)

These appear as rendered section labels in the sidebar, not from FTL:

| English             | Vietnamese            |
| ------------------- | --------------------- |
| Constructor         | Hàm khởi tạo          |
| Instance methods    | Phương thức phiên bản |
| Instance properties | Thuộc tính phiên bản  |
| Static methods      | Phương thức tĩnh      |
| Static properties   | Thuộc tính tĩnh       |
| Events              | Sự kiện               |
| Guides              | Hướng dẫn             |
| Interfaces          | Giao diện             |
| Deprecated          | Đã lỗi thời           |
| Experimental        | Thử nghiệm            |
| Non-standard        | Không chuẩn           |

---

## Implementation notes

- `vi.ftl` is maintained in `translate/vi.ftl` and must be copied to
  `node_modules/@mdn/fred/l10n/locales/vi.ftl` before building.
- The build script (`mdn-worker/scripts/export-static.mjs`) also does HTML
  post-processing to replace SSR-baked English strings that can't be reached via FTL
  (since the SSR runs on en-US locale docs).
- Sidebar section label translations ("Constructor", "Instance methods", etc.) are
  translated in the page markdown (## headings) itself, not in FTL.
