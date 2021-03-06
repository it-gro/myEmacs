;;; hugo-tmpl-mode.el --- major mode for editing hugo files. -*- coding: utf-8; lexical-binding: t; -*-

;; Copyright © 2018, by it-gro

;; Author: it-gro
;; Version: 1.0.0
;; Created: 2018-02-10
;; Keywords: languages
;; Homepage:

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the terms
;; of the GNU General Public License version 2.

;;; Commentary:

;; short description here

;; full doc on how to use here

;;; Code:

;; create the list for font-lock.
;; each category of keyword is given a particular face

(defconst hugo-tmpl-actions
  '(
     "block"
     "define"
     "else"
     "end"
     "if"
     "partial"
     "range"
     "template"
     "with"
     )
  "TODO."
  )

(defconst hugo-tmpl-vars
  '(
     ".File"
     ".GitInfo"
     ".Hugo"
     ".Menu"
     ".Page"
     ".Site"
     ".Sitemap"
     )
  "TODO."
  )

(defconst hugo-tmpl-var-frontmatter
  '(
           ".Aliases"
           ".Date"
           ".Description"
           ".Draft"
           ".ExpiryDate"
           ".Keywords"
           ".Lastmod"
           ".Layout"
           ".LinkTitle"
           ".Markup"
           ".PublishDate"
           ".Slug"
           ".Title"
           ".Type"
           ".Weight"
     )
  "TODO."
  )

(defconst hugo-tmpl-var-file
  '(
           ".BaseFileName"
           ".Dir"
           ".Ext"
           ".Lang"
           ".LogicalName"
           ".Path"
           ".TranslationBaseName"
     )
  "TODO."
  )

(defconst hugo-tmpl-var-page
  '(
           ".AlternativeOutputFormats"
           ".Data"
           ".Date"
           ".Description"
           ".Dir"
           ".Draft"
           ".ExpiryDate"
           ".File"
           ".FuzzyWordCount"
           ".Hugo"
           ".IsHome"
           ".IsNode"
           ".IsPage"
           ".IsTranslated"
           ".Keywords"
           ".Kind"
           ".Lang"
           ".Language"
           ".Lastmod"
           ".LinkTitle"
           ".Next"
           ".NextInSection"
           ".OutputFormats"
           ".Pages"
           ".Permalink"
           ".PlainWords"
           ".Prev"
           ".PrevInSection"
           ".PublishDate"
           ".RSSLink"
           ".ReadingTime"
           ".Ref"
           ".RelPermalink"
           ".RelRef"
           ".Site"
           ".Title"
           ".Translations"
           ".Truncated"
           ".Type"
           ".URL"
           ".UniqueID"
           ".Weight"
           ".WordCount"
     )
  "TODO."
  )

(defconst hugo-tmpl-var-gitinfo
  '(
           ".Subject"
           ".AuthorDate"
     )
  "TODO."
  )

(defconst hugo-tmpl-var-menu
  '(
           ".Children"
           ".Identifier"
           ".Menu"
           ".Name"
           ".Parent"
           ".Post"
           ".Pre"
           ".URL"
           ".Weight"
     )
  "TODO."
  )

(defconst hugo-tmpl-var-hugo
  '(
           ".Version"
           ".CommitHash"
           ".BuildDate"
     )
  "TODO."
  )

(defconst hugo-tmpl-var-sitemap
  '(
           ".ChangeFreq"
           ".Priority"
           ".Filename"
     )
  "TODO."
  )

(defconst hugo-tmpl-var-site
  '(
           ".AllPages"
           ".Author"
           ".BaseURL"
           ".BuildDrafts"
           ".Copyright"
           ".Data"
           ".DisqusShortname"
           ".GoogleAnalytics"
           ".IsMultiLingual"
           ".Language"
           ".LanguageLang"
           ".LanguageLanguageName"
           ".LanguageWeight"
           ".LanguageCode"
           ".LanguagePrefix"
           ".Languages"
           ".LastChange"
           ".Menus"
           ".Pages"
           ".Params"
           ".Permalinks"
           ".RSSLink"
           ".RegularPages"
           ".Sections"
           ".Taxonomies"
           ".Title"
     )
  "TODO."
  )


;; https://golang.org/pkg/text/template/#hdr-Functions
(defconst hugo-tmpl-go-tmpl
  '(
     ".Unix"
     "and"
     "call"
     "eq"
     "ge"
     "gt"
     "index"
     "le"
     "len"
     "lt"
     "ne"
     "not"
     "or"
     "print"
     "printf"
     "println"
     )
  "TODO."
  )

(defconst hugo-tmpl-functions
  '(
     ".AddDate"
     ".Format"
     ".Get"
     ".GetPage"
     ".HasChildren"
     ".HasMenuCurrent"
     ".IsMenuCurrent"
     ".Param"
     ".Scratch.Add"
     ".Scratch.Get"
     ".Scratch.GetSortedMapValues"
     ".Scratch.Set"
     ".Scratch.SetInMap"
     ".TrimLeft"
     ".TrimPrefix"
     ".TrimRight"
     ".TrimSuffix"
     "absLangURL"
     "absURL"
     "add"
     "after"
     "apply"
     "base64"
     "chomp"
     "cond"
     "countrunes"
     "countwords"
     "dateFormat"
     "default"
     "delimit"
     "dict"
     "div"
     "echoParam"
     "emojify"
     "errorf"
     "fileExists"
     "findRE"
     "first"
     "float"
     "getenv"
     "hasprefix"
     "highlight"
     "htmlEscape"
     "htmlUnescape"
     "humanize"
     "i18n"
     "in"
     "int"
     "intersect"
     "isset"
     "jsonify"
     "lang.NumFmt"
     "last"
     "lower"
     "markdownify"
     "math.Ceil"
     "math.Floor"
     "math.Round"
     "md5"
     "mod"
     "modBool"
     "mul"
     "now"
     "partialCached"
     "plainify"
     "pluralize"
     "querify"
     "readDir"
     "readFile"
     "ref"
     "relLangURL"
     "relURL"
     "relref"
     "render"
     "replace"
     "replaceRE"
     "safeCSS"
     "safeHTML"
     "safeHTMLAttr"
     "safeJS"
     "safeURL"
     "seq"
     "sha"
     "shuffle"
     "singularize"
     "slice"
     "slicestr"
     "sort"
     "split"
     "string"
     "sub"
     "substr"
     "time"
     "title"
     "trim"
     "truncate"
     "union"
     "uniq"
     "upper"
     "urlize"
     "urls.Parse"
     "where"
     "with"
     )
  "TODO."
  )


(defconst hugo-tmpl-variable-regexp
  "\\b\\(\\$[_[:alpha:]]+\\)"
  "Regexp string to highlight variables."
  )

(defconst hugo-tmpl-string-regexp
  "\\(`.*?`\\|\".*?\"\\)"
  "Regexp string to highlight strings."
  )

(defconst hugo-tmpl-comment-regexp
  "{{-?\s*\\(/\\*\\(?:.\\|\n\\)*?\\*/\\)\s*-?}}"
  "Regexp string to highlight comments."
  )

(defconst hugo-tmpl-start-end-regexp
  "\\({{\\|}}\\)"
  "Regexp string to highlight start and end."
  )

(defconst hugo-tmpl-expand
  (append
    hugo-tmpl-actions
    hugo-tmpl-vars
    hugo-tmpl-var-frontmatter
    hugo-tmpl-var-file
    hugo-tmpl-var-page
    hugo-tmpl-var-gitinfo
    hugo-tmpl-var-menu
    hugo-tmpl-var-hugo
    hugo-tmpl-var-sitemap
    hugo-tmpl-var-site
    hugo-tmpl-functions
    )
  "TODO."
  )

(setq hugo-tmpl-font-lock-keywords
  (let*
    (
      ;; generate regex string for each category of keywords
      (x-actions-regexp           (regexp-opt hugo-tmpl-actions                  'symbols))
      (x-functions-regexp         (regexp-opt hugo-tmpl-functions                'symbols))
      (x-go-tmpl-regexp           (regexp-opt hugo-tmpl-go-tmpl                  'symbols))
      (x-var-frontmatter-regexp   (concat (regexp-opt hugo-tmpl-var-frontmatter  nil) "\\b" ))
      (x-var-file-regexp          (concat (regexp-opt hugo-tmpl-var-file         nil) "\\b" ))
      (x-var-page-regexp          (concat (regexp-opt hugo-tmpl-var-page         nil) "\\b" ))
      (x-var-gitinfo-regexp       (concat (regexp-opt hugo-tmpl-var-gitinfo      nil) "\\b" ))
      (x-var-hugo-tmpl-regexp     (concat (regexp-opt hugo-tmpl-var-hugo         nil) "\\b" ))
      (x-var-menu-regexp          (concat (regexp-opt hugo-tmpl-var-menu         nil) "\\b" ))
      (x-var-sitemap-regexp       (concat (regexp-opt hugo-tmpl-var-sitemap      nil) "\\b" ))
      (x-var-site-regexp          (concat (regexp-opt hugo-tmpl-var-site         nil) "\\b" ))
      (x-vars-regexp              (concat (regexp-opt hugo-tmpl-vars             nil) "\\b" ))
      )

    `(
       (,hugo-tmpl-comment-regexp        1 font-lock-comment-face)
       (,hugo-tmpl-start-end-regexp      1 font-lock-preprocessor-face)
       (,hugo-tmpl-string-regexp         1 font-lock-string-face)
       (,hugo-tmpl-variable-regexp       1 font-lock-variable-name-face)

       (,x-actions-regexp               . font-lock-warning-face)
       (,x-go-tmpl-regexp               . font-lock-type-face)
       (,x-functions-regexp             . font-lock-type-face)
       (,x-var-frontmatter-regexp       . font-lock-builtin-face)
       (,x-var-file-regexp              . font-lock-builtin-face)
       (,x-var-page-regexp              . font-lock-builtin-face)
       (,x-var-gitinfo-regexp           . font-lock-builtin-face)
       (,x-var-hugo-tmpl-regexp         . font-lock-builtin-face)
       (,x-var-menu-regexp              . font-lock-builtin-face)
       (,x-var-sitemap-regexp           . font-lock-builtin-face)
       (,x-var-site-regexp              . font-lock-builtin-face)
       (,x-vars-regexp                  . font-lock-constant-face)

       ;; note: order above matters, because once colored, that part won't change.
       ;; in general, put longer words first

       ;; font-lock-builtin-face
       ;; font-lock-comment-delimiter-face
       ;; font-lock-constant-face
       ;; font-lock-function-name-face
       ;; font-lock-keyword-face
       ;; font-lock-preprocessor-face
       ;; font-lock-reference-face
       ;; font-lock-string-face
       ;; font-lock-type-face
       ;; font-lock-variable-name-face
       ;; font-lock-warning-face

       )
    )
  )

;;(font-lock-add-keywords 'mhtml-mode hugo-tmpl-font-lock-keywords)
;;(font-lock-add-keywords 'html-mode hugo-tmpl-font-lock-keywords)

;;;###autoload
(define-derived-mode hugo-tmpl-mode mhtml-mode "hugo tmpl"
  "Major mode for editing hugo files"

  ;;; code for syntax highlighting
  ;;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Font-Lock-Basics.html#Font-Lock-Basics
  ;;;  The second element, keywords-only, specifies the value of the
  ;;;  variable font-lock-keywords-only. If this is omitted or nil,
  ;;;  syntactic fontification (of strings and comments) is also
  ;;;  performed. If this is non-nil, syntactic fontification is not
  ;;;  performed.
  (setq font-lock-defaults
    '(hugo-tmpl-font-lock-keywords 0) )
  )

;; add the mode to the `features' list
(provide 'hugo-tmpl-mode)

;;; hugo-tmpl-mode.el ends here
