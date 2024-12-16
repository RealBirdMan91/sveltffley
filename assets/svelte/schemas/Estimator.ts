import {z} from 'zod';

export const EstimatorSchema = z.object({
    ticketPrice: z.coerce.number().positive().min(1).max(100),
});

export type Estimator = z.infer<typeof EstimatorSchema>;