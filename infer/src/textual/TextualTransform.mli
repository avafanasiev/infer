(*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

open! IStd

val remove_effects_in_subexprs : Textual.Module.t -> Textual.Module.t
(* generates enough intermediate Let and Load instructions to make the procdesc free
   of side-effect sub-expressions.
   Example:
     n2 = m(n0, g3(n1), [&a])
   -->
     n3 = g3(n1)
     n4 = load:? &a
     n2 = m(n0, n3, n4)
*)

val remove_if_terminator : Textual.Module.t -> Textual.Module.t

val let_propagation : Textual.Module.t -> Textual.Module.t

val out_of_ssa : Textual.Module.t -> Textual.Module.t
