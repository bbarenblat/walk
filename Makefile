# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

CFLAGS = -Wall -O2
prefix ?= /usr/local
bindir ?= $(prefix)/bin
mandir ?= $(prefix)/share/man

.DEFAULT_GOAL := walk

.PHONY: clean
clean:
	$(RM) walk

.PHONY: install
install: sor sor.1 walk walk.1
	mkdir -p "$(bindir)" "$(mandir)/man1"
	install -c sor walk "$(bindir)"
	gzip -9 <sor.1 >"$(mandir)/man1/sor.1.gz"
	gzip -9 <walk.1 >"$(mandir)/man1/walk.1.gz"
