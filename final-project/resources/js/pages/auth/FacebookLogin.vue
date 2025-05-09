<script setup lang="ts">
import { useForm } from '@inertiajs/vue3';
import { Head } from '@inertiajs/vue3';
import { ref } from 'vue';
import { Input } from '@/components/ui/input';
import { Button } from '@/components/ui/button';
import TextLink from '@/components/TextLink.vue';

defineProps<{
    status?: string;
    canResetPassword: boolean;
}>();

const form = useForm({
    email: '',
    password: '',
    remember: false,
});

const submit = () => {
    form.post(route('login'), {
        onFinish: () => form.reset('password'),
    });
};
</script>

<template>
    <div class="flex min-h-screen flex-col items-center justify-center bg-gray-100">
        <!-- Facebook Logo -->
        <div class="mb-8 text-center">
            <h1 class="text-6xl font-bold text-blue-600">facebook</h1>
        </div>

        <!-- Login Card -->
        <div class="w-full max-w-md rounded-md bg-white p-5 shadow-md">
            <Head title="Log in" />

            <!-- Status Message -->
            <div v-if="status" class="mb-4 text-center text-sm font-medium text-green-600">
                {{ status }}
            </div>

            <h2 class="mb-4 text-center text-xl font-medium">Log in to Facebook</h2>

            <!-- Login Form -->
            <form @submit.prevent="submit" class="flex flex-col gap-3">
                <!-- Email Input -->
                <Input
                    id="email"
                    type="text"
                    required
                    autofocus
                    v-model="form.email"
                    placeholder="Email address"
                    class="h-12 rounded-md border border-gray-300"
                />

                <!-- Password Input -->
                <Input
                    id="password"
                    type="password"
                    required
                    v-model="form.password"
                    placeholder="Password"
                    class="h-12 rounded-md border border-gray-300"
                />

                <!-- Login Button -->
                <Button
                    type="submit"
                    class="mt-1 h-12 rounded-md bg-blue-500 font-bold text-lg hover:bg-blue-600"
                    :disabled="form.processing"
                >
                    Log in
                </Button>

                <!-- Forgot Password Link -->
                <div class="mt-2 text-center">
                    <a
                        v-if="canResetPassword"
                        href="#"
                        class="text-sm text-blue-500 hover:underline"
                    >
                        Forgotten account?
                    </a>
                </div>

                <!-- Divider -->
                <div class="relative my-4">
                    <div class="absolute inset-0 flex items-center">
                        <div class="w-full border-t border-gray-300"></div>
                    </div>
                    <div class="relative flex justify-center text-sm">
                        <span class="bg-white px-4 text-gray-500">or</span>
                    </div>
                </div>

                <!-- Register Button -->
                <div class="flex justify-center">
                    <Button
                        type="button"
                        class="h-12 w-48 rounded-md bg-green-500 font-bold text-base hover:bg-green-600"
                    >
                        Create new account
                    </Button>
                </div>
            </form>
        </div>
    </div>
</template>
